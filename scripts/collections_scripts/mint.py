#!/usr/bin/python3
from brownie import accounts, network, config, MyToken, Contract
from brownie.convert import EthAddress
from scripts.helpful_scripts import OPENSEA_FORMAT



def main():
    dev = accounts.add(config["wallets"]["from_key"])
    print(network.show_active())
    #collection = MyToken[len(MyToken) - 1]
    collection = Contract('0x5822e34a7d9e52206653912fdc6f27eea6cba8c6')
    address_out = EthAddress('0x9f4CA7F3BbF23f4Df191c7E1A7E96c22F706AD36')
    token_id = 2;
    cantidad = 5
    transaction = collection.mint(address_out, token_id, cantidad, {"from": dev})
    transaction.wait(1)
    print(
        "Felicitaciones ahora puedes distrutar tu NFT {}".format(
            OPENSEA_FORMAT.format(collection.address, token_id)
        )
    )
    print('Por favor espere 20 minutos para refrescar la ventana') 
