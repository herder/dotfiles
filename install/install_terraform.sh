sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
if [ ! -e /usr/share/keyrings/hashicorp-archive-keyring.gpg ] ; then
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
fi
# gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
if [ -e /etc/apt/sources.list.d/hashicorp.list ]; then 
  sudo rm /etc/apt/sources.list.d/hashicorp.list 
fi
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install -y terraform terraform-ls
