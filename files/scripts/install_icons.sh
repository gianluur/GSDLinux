#!/usr/bin/env bash
set -euo pipefail

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

echo "=== Installing vinceliuice/MacTahoe icons & cursor ==="

GIT_REPO_URL="https://github.com/vinceliuice/MacTahoe-icon-theme.git"
REPO_NAME="MacTahoe-icon-theme"
DESTINATION_PATH="/usr/share/icons"

# Ensure git is available
if ! command_exists git; then
    echo "git is not installed, attempting to install it..."
    if command_exists dnf; then
        dnf install -y git
    else
        echo "ERROR: git is not installed and no supported package manager found." >&2
        exit 1
    fi
fi

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

echo "Downloading the git repo..."
git clone "${GIT_REPO_URL}" "${TMP_DIR}/${REPO_NAME}"

echo "Running the icon pack installer..."
"${TMP_DIR}/${REPO_NAME}/install.sh" -d "${DESTINATION_PATH}" -t all -b

echo "Updating icon caches..."
for theme_dir in "${DESTINATION_PATH}"/*/; do
    if [[ -f "${theme_dir}index.theme" ]]; then
        gtk-update-icon-cache -f -t "${theme_dir}" || true
    fi
done

echo "Runnig the cursor installer"
"${TMP_DIR}/${REPO_NAME}/cursors/install.sh"

echo "=== MacTahoe icon pack installation complete ==="
