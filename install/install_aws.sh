#!/bin/bash -e

# https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install
# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html

echo "* Switching to tmp folder..."
cd "$(mktemp -d)"
echo
echo "* Downloading the AWS cli..."
wget -q "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -O awscliv2.zip
echo
echo "* Unzipping it..."
unzip -q awscliv2.zip
echo
if [ -f /usr/local/bin/aws ]; then
    echo "* Current version:"
    /usr/local/bin/aws --version
    echo "* Updating..."
    sudo ./aws/install --update
else
    echo "* Installing..."
    sudo ./aws/install
fi
echo
echo "* Install and activate bash autocompletion..."
if ! grep -q aws_completer ~/.bashrc; then
    echo "complete -C '/usr/local/bin/aws_completer' aws" | tee -a ~/.bashrc
fi
complete -C '/usr/local/bin/aws_completer' aws
cd -
echo
echo "* Installed version:"
/usr/local/bin/aws --version
echo
