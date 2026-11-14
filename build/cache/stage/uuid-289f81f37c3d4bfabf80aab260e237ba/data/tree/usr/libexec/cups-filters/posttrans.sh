#!/usr/bin/bash

if grep -q -R 'FoomaticRIPCommandLine\|FoomaticRIPOptionSetting\|FoomaticRIPOption' /etc/cups/ppd
then
  tmpfile=$(mktemp -p /var/tmp foomatic-scan.XXXXXXXX)

  for ppd in /etc/cups/ppd/*.ppd
  do
    foomatic-hash --ppd $ppd $tmpfile /etc/foomatic/hashes.d/hashes.foomatic-opt-update || :
  done

  if test -f /etc/foomatic/hashes.d/hashes.foomatic-opt-update
  then
    echo "Foomatic-rip values which can inject code found - review findings in $tmpfile. Read release notes for instructions." || :
  fi
else
  touch /etc/foomatic/hashes.d/hashes.foomatic-opt-update
fi

exit 0
