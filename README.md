# Signet SDK
A simple kit to get started using signet.

## How to Start

Place your `bitcoind`, `bitcoin-cli`, and `bitcoin-util` in `bin` folder.

```bash
## Create a wallet (no descriptors).
./bcli -named createwallet wallet_name=signet descriptors=false
## Generate an address from the wallet.
./bcli -rpcwallet=signet getnewaddress
## Get the public key from the wallet.
./bcli getaddressinfo <address>
## Configure your signet challenge.
signetchallenge=5121{pubkey}51ae
## Configure the ./miner script, then run the start script.
./start.sh
```

## Resources

**Signet page on Github** 
https://github.com/bitcoin/bitcoin/tree/master/contrib/signet
