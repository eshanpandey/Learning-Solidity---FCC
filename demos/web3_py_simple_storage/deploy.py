from solcx import compile_standard, install_solc

with open("./SimpleStorage.sol","r")as file:
     Simple_Storage_file=file.read()
     print(Simple_Storage_file)
install_solc("0.6.0")

#compiling\\

compiled_sol = compile_standard(
    {
        "language": "Solidity",
        "sources": {"SimpleStorage.sol": {"content": Simple_Storage_file}},
        "settings": {
            "outputSelection": {
                "*": {
                    "*": ["abi", "metadata", "evm.bytecode", "evm.bytecode.sourceMap"]
                }
            }
        },
    },
    solc_version="0.6.0",
)

print(compiled_sol)