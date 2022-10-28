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
curl https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"
rustup update stable
# packages
sudo apt update
sudo apt install curl -y
sudo apt install git -y
sudo apt-get install libssl-dev -y
sudo apt-get install libclang-dev -y
apt-get update \
    && apt-get install -y --no-install-recommends \
    tzdata \
    ca-certificates \
    build-essential \
    pkg-config \
    cmake
git clone https://github.com/MystenLabs/sui.git
cd sui
git remote add upstream https://github.com/MystenLabs/sui
git fetch upstream
git checkout --track upstream/devnet
cp crates/sui-config/data/fullnode-template.yaml fullnode.yaml
curl -fLJO github.com/MystenLabs/sui-genesis/blob/main/devnet/genesis.blob
cargo run --release --bin sui-node -- --config-path fullnode.yaml