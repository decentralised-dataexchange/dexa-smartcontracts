<h1 align="center">
    Data Exchange Agreements (DEXA) Smart Contracts
</h1>

<p align="center">
    <a href="/../../commits/" title="Last Commit"><img src="https://img.shields.io/github/last-commit/decentralised-dataexchange/dexa-smartcontracts?style=flat"></a>
    <a href="/../../issues" title="Open Issues"><img src="https://img.shields.io/github/issues/decentralised-dataexchange/dexa-smartcontracts?style=flat"></a>
    <a href="./LICENSE" title="License"><img src="https://img.shields.io/badge/License-Apache%202.0-green.svg?style=flat"></a>
</p>

<p align="center">
  <a href="#about">About</a> •
  <a href="#release-status">Release Status</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#licensing">Licensing</a>
</p>

## About

This repository hosts the source code for DEXA smartcontracts and is part of the deliverables for Provenance services with smart data agreement ([PS-SDA](https://ontochain.ngi.eu/content/ps-sda)) project that has received funding from the European Union’s Horizon 2020 research and innovation programme under grant agreement No 957338. It implements DEXA smart contracts that can be deployed to locally or to cloud infrastructure with an Ethereum blockchain configured.
## Release Status

Not released, work in progress.

## Contract Deployments


| Network Name | name    | chainId | hexChainId | Registry Address                                                                                                             |
| ------------ | ------- | ------- | ---------- | ---------------------------------------------------------------------------------------------------------------------------- |
| Goerli       | rinkeby | 5       | 0x5        | [0xFCeE40992B9Bff888d2Faa0691878AD8D7567BA7](https://goerli.etherscan.io/address/0xFCeE40992B9Bff888d2Faa0691878AD8D7567BA7) |

## Compile and deploy the contract

Follow the instructions as given below:

1. Run `git clone git@github.com:decentralised-dataexchange/dexa-smartcontracts.git` to clone the repository.
2. `cd` in to the cloned folder.
3. Run `poetry shell` to setup a python virtual environment.
4. Run `poetry install` to install the dependencies.
5. Configure the following environment variables.
   1. `ETH_NODE_RPC` - Blockchain node RPC endpoint
   2. `ETH_PRIVATE_KEY` - Private key associated with the contract creator account address
   3. `ETH_ACCOUNT_ADDRESS` - Contract creator account address
6. `python scripts/compile_and_deploy.py` to compile and deploy.
7. If the script successfully executes, contract address is displayed in the terminal.


## Contributing

Feel free to improve the plugin and send us a pull request. If you found any problems, please create an issue in this repo.

## Licensing
Copyright (c) 2022-25 LCubed AB (iGrant.io), Sweden

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.

You may obtain a copy of the License at https://www.apache.org/licenses/LICENSE-2.0.

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the LICENSE for the specific language governing permissions and limitations under the License.
