#!/usr/bin/sh
  ALTS=""
  for BIN in dig host delv nslookup nsupdate arpaname nsec3hash named-{checkzone,compilezone} dnstap-read named-nzd2nzf; do
    
    BINX="/usr/bin/${BIN}"; 
    MANX="/usr/share/man/man1/${BIN}.1.gz"; 
    if ! [ -L "$BINX" ] && [ -f "$BINX" ] && [ -x "$BINX" ]; then 
      rm -f -- "$BINX"; 
    fi; 
    if ! [ -L "$MANX" ] && [ -f "$MANX" ]; then 
      rm -f -- "$MANX"; 
    fi
    [ "$BIN" != dig ] && ALTS+="\
  --follower /usr/bin/$BIN bind9-$BIN /usr/bin/$BIN-9 \
  --follower /usr/share/man/man1/$BIN.1.gz bind9-$BIN.1 /usr/share/man/man1/$BIN-9.1.gz"
  done
  for BIN in ddns-confgen tsig-keygen; do
    
    BINX="/usr/bin/${BIN}"; 
    MANX="/usr/share/man/man8/${BIN}.8.gz"; 
    if ! [ -L "$BINX" ] && [ -f "$BINX" ] && [ -x "$BINX" ]; then 
      rm -f -- "$BINX"; 
    fi; 
    if ! [ -L "$MANX" ] && [ -f "$MANX" ]; then 
      rm -f -- "$MANX"; 
    fi
    ALTS+="\
  --follower /usr/bin/$BIN bind9-$BIN /usr/bin/$BIN-9 \
  --follower /usr/share/man/man8/$BIN.8.gz bind9-$BIN.8 /usr/share/man/man8/$BIN-9.8.gz"
  done
  alternatives --install /usr/bin/dig bind9-utils-dig /usr/bin/dig-9 100 \
  \
  --follower /usr/share/man/man1/dig.1.gz bind9-dig.1 /usr/share/man/man1/dig-9.1.gz          \
  ${ALTS}
