if ! type jf >/dev/null 2>&1; then
wget -qO - https://releases.jfrog.io/artifactory/jfrog-gpg-public/jfrog_public_gpg.key | sudo apt-key add -
echo "deb https://releases.jfrog.io/artifactory/jfrog-debs xenial contrib" | sudo tee -a /etc/apt/sources.list;
sudo apt update;
sudo apt install -y jfrog-cli-v2-jf
fi
