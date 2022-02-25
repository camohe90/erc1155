#!/usr/bin/python3
from brownie import MyToken, accounts, network, config
from scripts.helpful_scripts import get_publish_source

def main():
    dev = accounts.add(config["wallets"]["from_key"])
    print(network.show_active())
    MyToken.deploy({"from": dev})