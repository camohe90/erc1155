#!/usr/bin/python3
from brownie import accounts, network, config, Contract
from scripts.helpful_scripts import OPENSEA_FORMAT

sample_token_uri = "https://gateway.pinata.cloud/ipfs/QmNnQbnu8TLYGTi26mSmKnD5GRtQuxBSdX7LRJ9B7CyA22/obra1.json"


def main():
    dev = accounts.add(config["wallets"]["from_key"])
    print(network.show_active())
    collection = Contract()
    transaction = collection.(sample_token_uri, {"from": dev})
    transaction.wait(1)
    print(
        "Felicitaciones ahora puedes distrutar tu NFT {}".format(
            OPENSEA_FORMAT.format(improve_collectible.address)
        )
    )
    print('Por favor espere 20 minutos para refrescar la ventana')
