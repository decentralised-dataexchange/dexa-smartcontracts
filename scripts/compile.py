import solcx

solcx.install_solc()

temp_file = solcx.compile_files('Incrementer.sol')

abi = temp_file['Incrementer.sol:Incrementer']['abi']
bytecode = temp_file['Incrementer.sol:Incrementer']['bin']
