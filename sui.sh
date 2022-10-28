#!/bin/bash

echo -e "\033[0;35m"
echo " ::::    :::  ::::::::  :::::::::  :::::::::: ::::::::  ";
echo " :+:+:   :+: :+:    :+: :+:    :+: :+:       :+:    :+: ";
echo " :+:+:+  +:+ +:+    +:+ +:+    +:+ +:+       +:+        ";
echo " +#+ +:+ +#+ +#+    +:+ +#+    +:+ +#++:++#  +#++:++#++ ";
echo " +#+  +#+#+# +#+    +#+ +#+    +#+ +#+              +#+ ";
echo " #+#   #+#+# #+#    #+# #+#    #+# #+#       #+#    #+# ";
echo " ###    ####  ########  #########  ########## ########  ";
echo -e "\e[0m"

sleep 2

echo -e "\e[1m\e[32m1. Updating packages... \e[0m" && sleep 1
# update
sudo apt update && sudo apt upgrade -y

echo -e "\e[1m\e[32m2. Installing dependencies... \e[0m" && sleep 1
#Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
rustup update stable
# packages
sudo apt update
sudo apt install curl -y
sudo apt install git -y
sudo apt-get install libssl-dev
sudo apt-get install libclang-dev
apt-get update \
    && apt-get install -y --no-install-recommends \
    tzdata \
    ca-certificates \
    build-essential \
    pkg-config \
    cmake

