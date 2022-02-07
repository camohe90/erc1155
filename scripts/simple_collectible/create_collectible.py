#!/usr/bin/python3
from brownie import SimpleCollectible, accounts, network, config
from scripts.helpful_scripts import OPENSEA_FORMAT

sample_token_uri = "https://gateway.pinata.cloud/ipfs/QmWQsp2XQk6L5xVhSvMb6xZ2WSTDW2415czRZbZjYFKXPN?preview=1"


def main():
    dev = accounts.add(config["wallets"]["from_key"])
    print(network.show_active())
    simple_collectible = SimpleCollectible[len(SimpleCollectible) - 1]
    token_id = simple_collectible.tokenCounter()
    transaction = simple_collectible.createCollectible(sample_token_uri, {"from": dev})
    transaction.wait(1)
    print(
        "Felicitaciones ahora puedes distrutar tu NFT {}".format(
            OPENSEA_FORMAT.format(simple_collectible.address, token_id)
        )
    )
    print('Por favor espere 20 minutos para refrescar la ventana')
