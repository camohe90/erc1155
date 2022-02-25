#!/usr/bin/python3
from brownie import accounts, network, config, Contract
from scripts.helpful_scripts import OPENSEA_FORMAT



def main():
    dev = accounts.add(config["wallets"]["from_key"])
    print(network.show_active())
    collection = Contract('0x824b4ba857175eCcb2299E78E46BcbD4c6e527A9')
    """transaction = collection.mint(0x9f4CA7F3BbF23f4Df191c7E1A7E96c22F706AD36, 1, 2, {"from": dev})
    transaction.wait(1)
    print(
        "Felicitaciones ahora puedes distrutar tu NFT {}".format(
            OPENSEA_FORMAT.format(collection.address)
        )
    )
    print('Por favor espere 20 minutos para refrescar la ventana') """
