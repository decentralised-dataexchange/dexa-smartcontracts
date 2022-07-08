from compile import abi, bytecode

account_from = {
    'private_key': 'YOUR-PRIVATE-KEY-HERE',
    'address': 'PUBLIC-ADDRESS-OF-PK-HERE',
}

print(f'Attempting to deploy from account: { account_from["address"] }')

Incrementer = web3.eth.contract(abi=abi, bytecode=bytecode)

construct_txn = Incrementer.constructor(5).buildTransaction(
    {
        'from': account_from['address'],
        'nonce': web3.eth.get_transaction_count(account_from['address']),
    }
)

tx_create = web3.eth.account.sign_transaction(
    construct_txn, account_from['private_key'])

tx_hash = web3.eth.send_raw_transaction(tx_create.rawTransaction)
tx_receipt = web3.eth.wait_for_transaction_receipt(tx_hash)

print(f'Contract deployed at address: { tx_receipt.contractAddress }')
