if ! type wezterm >/dev/null 2>&1; then
  echo "Installing wezterm"
  curl -LO https://github.com/wez/wezterm/releases/download/20230408-112425-69ae8472/wezterm-20230408-112425-69ae8472.Ubuntu22.04.deb
  sudo dpkg -i ./wezterm-20230408-112425-69ae8472.Ubuntu22.04.deb
  rm -f ./wezterm-20230408-112425-69ae8472.Ubuntu22.04.deb
sudo update-alternatives --set x-terminal-emulator $(which -a open-wezterm-here | tail -n1)
fi

