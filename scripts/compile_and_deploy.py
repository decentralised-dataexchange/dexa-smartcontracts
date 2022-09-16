import asyncio
import os
import typing

import solcx
from loguru import logger
from web3 import Web3


async def compile(contract_path: str) -> typing.Tuple[typing.Any, typing.Any]:
    """Compile the smart contract

    Returns:
        typing.Tuple[typing.Any, typing.Any]: Returns the bytecode, abi pair
    """

    # Install solidity compiler
    solcx.install_solc()

    # Compile the contract
    compiled = solcx.compile_files(contract_path, output_values=["abi", "bin"])

    # Obtain contract interface
    contract_id, contract_interface = compiled.popitem()

    # Bytecode
    bytecode = contract_interface["bin"]

    # ABI
    abi = contract_interface["abi"]

    return (bytecode, abi)


async def deploy(
    web3, private_key: str, account_address: str, contract_path: str
) -> None:
    """Deploy contract to blockchain

    Args:
        web3: Web3 client instance
        private_key (str): Private key
        account_address (str): Account address
    """

    # Compile
    (bytecode, abi) = await compile(contract_path)

    account_from = {
        "private_key": private_key,
        "address": account_address,
    }

    logger.info(f'Attempting to deploy from account: { account_from["address"] }')

    dexa = web3.eth.contract(abi=abi, bytecode=bytecode)
    construct_txn = dexa.constructor().buildTransaction(
        {
            "from": account_from["address"],
            "nonce": web3.eth.get_transaction_count(account_from["address"]),
            "gas": 1728712,
            "gasPrice": web3.toWei("21", "gwei"),
        }
    )

    tx_create = web3.eth.account.sign_transaction(
        construct_txn, account_from["private_key"]
    )

    tx_hash = web3.eth.send_raw_transaction(tx_create.rawTransaction)
    tx_receipt = web3.eth.wait_for_transaction_receipt(tx_hash)

    print(f"Contract deployed at address: { tx_receipt.contractAddress }")


if __name__ == "__main__":

    provider_rpc = {
        "rinkeby": str(os.environ.get("ETH_NODE_RPC")),
    }

    web3 = Web3(Web3.HTTPProvider(provider_rpc["rinkeby"]))

    private_key = str(os.environ.get("INTERMEDIARY_ETH_PRIVATE_KEY"))
    account_address = str(os.environ.get("INTERMEDIARY_ETH_ACCOUNT_ADDRESS"))

    asyncio.run(deploy(web3, private_key, account_address, "./contracts/DEXA.sol"))

    # asyncio.run(compile('./contracts/DEXA.sol'))
