#!/bin/bash

# Check if 'installed' file exists
if [ -f ~/installed ]; then
    bash ~/shell.sh
fi

# Create 'installed' file to mark installation
touch ~/installed

# Variables
PYTHON_VERSION=3.11.4
NODE_VERSION=lts
GO_TTY_VERSION=v1.4.0
CODE_SERVER_VERSION=4.15.0

# Create directories for installations
mkdir -p ~/bin ~/src
export PATH=$HOME/bin:$PATH

# Install Python 3.11
cd ~/src
wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
tar -xzf Python-$PYTHON_VERSION.tgz
cd Python-$PYTHON_VERSION
./configure --prefix=$HOME/python
make -j$(nproc)
make install
export PATH=$HOME/python/bin:$PATH

# Install NVM and Node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
source $NVM_DIR/nvm.sh
nvm install $NODE_VERSION

# Install Speedtest CLI
cd ~/bin
wget -O speedtest.tgz https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-x86_64.tgz
tar -xzf speedtest.tgz
mv speedtest $HOME/bin/speedtest
rm speedtest.tgz

# Install PHP-FPM
cd ~/src
wget https://www.php.net/distributions/php-8.1.9.tar.gz
tar -xzf php-8.1.9.tar.gz
cd php-8.1.9
./configure --prefix=$HOME/php --with-fpm
make -j$(nproc)
make install
export PATH=$HOME/php/bin:$PATH

# Install Nginx
cd ~/src
wget http://nginx.org/download/nginx-1.21.6.tar.gz
tar -xzf nginx-1.21.6.tar.gz
cd nginx-1.21.6
./configure --prefix=$HOME/nginx --without-http_rewrite_module --without-http_gzip_module
make -j$(nproc)
make install
export PATH=$HOME/nginx/sbin:$PATH

# Install GoTTY
cd ~/src
wget https://github.com/yudai/gotty/releases/download/$GO_TTY_VERSION/gotty_linux_amd64.tar.gz
tar -xzf gotty_linux_amd64.tar.gz
mv gotty $HOME/bin/gotty
chmod +x $HOME/bin/gotty

# Install tmate
cd ~/src
git clone https://github.com/tmate-io/tmate.git
cd tmate
./autogen.sh
./configure --prefix=$HOME/tmate
make -j$(nproc)
make install
export PATH=$HOME/tmate/bin:$PATH

# Install code-server
cd ~/src
wget https://github.com/coder/code-server/releases/download/v$CODE_SERVER_VERSION/code-server-$CODE_SERVER_VERSION-linux-amd64.tar.gz
tar -xzf code-server-$CODE_SERVER_VERSION-linux-amd64.tar.gz
mv code-server-$CODE_SERVER_VERSION-linux-amd64/code-server $HOME/bin/code-server
chmod +x $HOME/bin/code-server

# Install OpenJDK 18
cd ~/src
wget https://download.java.net/java/GA/jdk18/0d483e3a8d8f4f1b85c91a7b6881c5b8/7/GPL/openjdk-18_linux-x64_bin.tar.gz
tar -xzf openjdk-18_linux-x64_bin.tar.gz
mv jdk-18 $HOME/openjdk-18
export PATH=$HOME/openjdk-18/bin:$PATH

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# Cleanup
rm -rf ~/src

# Ensure the paths are added to .bashrc for persistence
echo 'export PATH=$HOME/python/bin:$HOME/php/bin:$HOME/nginx/sbin:$HOME/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# Create shell.sh
cat << 'EOF' > ~/shell.sh
#!/bin/bash

echo -e "\e[0m"
echo -e "\e[0m"
echo -e "\e[0;95m████████╗ ██████╗███╗   ██╗    ███╗   ██╗███████╗████████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗███████╗"
echo -e "\e[0;95m╚══██╔══╝██╔════╝████╗  ██║    ████╗  ██║██╔════╝╚══██╔══╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝██╔════╝"
echo -e "\e[0;95m   ██║   ██║     ██╔██╗ ██║    ██╔██╗ ██║█████╗     ██║   ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ ███████╗"
echo -e "\e[0;95m   ██║   ██║     ██║╚██╗██║    ██║╚██╗██║██╔══╝     ██║   ██║███╗██║██║   ██║██╔══██╗██╔═██╗ ╚════██║"
echo -e "\e[0;95m   ██║   ╚██████╗██║ ╚████║    ██║ ╚████║███████╗   ██║   ╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗███████║"
echo -e "\e[0;95m   ╚═╝    ╚═════╝╚═╝  ╚═══╝    ╚═╝  ╚═══╝╚══════╝   ╚═╝    ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝"
echo -e "\e[0m"
echo -e "\e[0m"
sleep 1
echo -e "\e[101mYour container in 3 seconds...\e[0m"
sleep 1
echo -e "\e[101mYour container in 2 seconds...\e[0m"
sleep 1
echo -e "\e[101mYour container in 1 seconds...\e[0m"
sleep 1
echo -e "\e[101mProvisioning your container!\e[0m"
echo -e "\e[0m"

# Adding a 2-second delay
sleep 3

# clear your browsing history
clear
echo -e "\e[0m"
echo -e "\e[0m"
echo -e "\e[0;95m████████╗ ██████╗███╗   ██╗    ███╗   ██╗███████╗████████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗███████╗"
echo -e "\e[0;95m╚══██╔══╝██╔════╝████╗  ██║    ████╗  ██║██╔════╝╚══██╔══╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝██╔════╝"
echo -e "\e[0;95m   ██║   ██║     ██╔██╗ ██║    ██╔██╗ ██║█████╗     ██║   ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ ███████╗"
echo -e "\e[0;95m   ██║   ██║     ██║╚██╗██║    ██║╚██╗██║██╔══╝     ██║   ██║███╗██║██║   ██║██╔══██╗██╔═██╗ ╚════██║"
echo -e "\e[0;95m   ██║   ╚██████╗██║ ╚████║    ██║ ╚████║███████╗   ██║   ╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗███████║"
echo -e "\e[0;95m   ╚═╝    ╚═════╝╚═╝  ╚═══╝    ╚═╝  ╚═══╝╚══════╝   ╚═╝    ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝"
echo -e "\e[0m"
echo -e "\e[0m"

echo ""
echo -e "\e[32m#####################################################"
echo -e "\e[32m"
echo -e "\e[1;96m    Welcome to Your Server!"
echo -e "\e[32m"
echo -e "\e[1;96m    Here are some instructions and server details:"
echo -e "\e[32m"
echo -e "\e[92m    Hostname: $(hostname)"
echo -e "\e[92m    IP address: $(curl -s ifconfig.me)"
echo -e "\e[92m    Local IP address: $(hostname -I)"
echo -e "\e[32m"
echo -e "\e[93m    Please read and abide by the following:"
echo -e "\e[93m    - Do not run XMRig or any other cryptominers without permissions."
echo -e "\e[93m    - Do not run Minecraft servers or use this container for illegal purposes."
echo -e "\e[32m"
echo -e "\e[91m    By using this server, you agree to our Terms of Service and Privacy Policy:"
echo -e "\e[91m    Terms of Service: https://tcnetwk.cloud/terms-of-service.html"
echo -e "\e[91m    Privacy Policy: https://tcnetwk.cloud/privacy-policy.html"
echo -e "\e[32m"
echo -e "\e[32m#####################################################"
echo -e "\e[0m"
echo -e "\e[0m"

# End of script
EOF

# Launch shell.sh
chmod +x ~/shell.sh
~/shell.sh
