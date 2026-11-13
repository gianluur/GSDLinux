#!/usr/bin/env bash
#
# build.sh - Genera Containerfile, costruisce l'immagine e produce l'ISO
# Dipendenze: bluebuild, podman, yq (opzionale, fallback su grep), realpath

set -euo pipefail

# === CONFIGURAZIONE ===
RECIPE="recipes/recipe.yaml"
BLUEPRINT="blueprint.toml"
BUILD_DIR="build"
CONTAINER_DIR="${BUILD_DIR}/container"
ISO_DIR="${BUILD_DIR}/iso"
IMAGE_BUILDER_IMAGE="ghcr.io/osbuild/image-builder-cli:latest"
BLUEBUILD_BIN="$(command -v bluebuild)"

# === VERIFICA PREREQUISITI ===
for f in "${RECIPE}" "${BLUEPRINT}"; do
  if [[ ! -f "$f" ]]; then
    echo "ERRORE: file non trovato: $f" >&2
    exit 1
  fi
done

if [[ -z "${BLUEBUILD_BIN}" ]]; then
  echo "ERRORE: bluebuild non trovato nel PATH" >&2
  exit 1
fi

# === ESTRAZIONE DEL NOME IMMAGINE DAL RECIPE ===
# Usa yq se disponibile, altrimenti fallback su grep/sed per il campo 'name:'
if command -v yq &>/dev/null; then
  IMAGE_NAME=$(yq -r '.name' "${RECIPE}")
else
  echo ">>> yq non trovato, uso grep come fallback"
  IMAGE_NAME=$(grep -E '^name:' "${RECIPE}" | head -1 | sed 's/^name:[[:space:]]*//')
fi

if [[ -z "${IMAGE_NAME}" || "${IMAGE_NAME}" == "null" ]]; then
  echo "ERRORE: impossibile estrarre 'name' da ${RECIPE}" >&2
  exit 1
fi

IMAGE_TAG="localhost/${IMAGE_NAME}:latest"
echo ">>> Immagine: ${IMAGE_TAG}"

# === PREPARAZIONE DIRECTORY ===
mkdir -p "${CONTAINER_DIR}" "${ISO_DIR}"

# === 1. GENERAZIONE DEL CONTAINERFILE ===
echo ">>> [1/3] Generazione Containerfile..."
sudo "${BLUEBUILD_BIN}" -v generate -o "${CONTAINER_DIR}/Containerfile" "${RECIPE}"

# === 2. BUILD DELL'IMMAGINE CONTAINER ===
# Il contesto di build è la root del repo, perché i moduli del recipe
# (es. 'from-file: modules/...') referenziano file relativi alla root.
echo ">>> [2/3] Build immagine container (contesto: .)..."
sudo podman build -t "${IMAGE_TAG}" -f "${CONTAINER_DIR}/Containerfile" .

# === 3. GENERAZIONE DELL'ISO ===
# Nota il mount di /var/lib/containers/storage: permette a image-builder
# di leggere l'immagine locale 'localhost/...' che è nello storage di root
# (coerente con l'uso di sudo su podman build).
mkdir -p "${BUILD_DIR}/osbuild-tmp"
mkdir -p "${BUILD_DIR}/osbuild-var-tmp"
mkdir -p "${BUILD_DIR}/osbuild-cache"

echo ">>> [3/3] Generazione ISO in ${ISO_DIR}..."
sudo podman run --rm --privileged \
  -v "$(realpath "${BUILD_DIR}/osbuild-tmp"):/tmp:Z" \
  -v "$(realpath "${BUILD_DIR}/osbuild-var-tmp"):/var/tmp:Z" \
  -v "$(realpath "${BUILD_DIR}/osbuild-cache"):/var/cache/image-builder:Z" \
  -v "$(realpath "${ISO_DIR}"):/output" \
  -v "$(realpath "${BLUEPRINT}"):/blueprint.toml:ro" \
  -v /var/lib/containers/storage:/var/lib/containers/storage \
  "${IMAGE_BUILDER_IMAGE}" build \
  --bootc-ref "${IMAGE_TAG}" \
  --bootc-default-fs btrfs \
  --blueprint /blueprint.toml \
  bootc-generic-iso

echo
echo ">>> Fatto. ISO disponibile in: $(realpath "${ISO_DIR}")"
ls -lh "${ISO_DIR}"


# sudo podman run --privileged ghcr.io/osbuild/image-builder-cli build --blueprint ./blueprint.toml --bootc--ref ./build/container/Containerfile --bootc-default-fs btrfs
