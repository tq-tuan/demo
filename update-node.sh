rm -r suidb genesis.blob
git fetch upstream
git checkout -B devnet --track upstream/devnet
curl -fLJO https://github.com/MystenLabs/sui-genesis/raw/main/devnet/genesis.blob
cargo run --release --bin sui-node -- --config-path fullnode.yaml
