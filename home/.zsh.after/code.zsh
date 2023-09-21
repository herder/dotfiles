if ! type code >/dev/null 2>&1; then
  "Visual Studio Code not found, installing..."
  local TMPDIR=$(mktemp -d)
curl -L -o $TMPDIR/code.deb https://update.code.visualstudio.com/latest/linux-deb-x64/stable
sudo dpkg -i $TMPDIR/code.deb
rm -rf $TMPDIR
fi
