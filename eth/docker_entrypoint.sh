#!/bin/bash
exec geth --datadir /root/ethereum/data --port 30303 \
		  --rpc --rpcport 8036 --rpcaddr 0.0.0.0 --rpcvhosts "*" --rpccorsdomain "*"  \
	      --ws --wsaddr 0.0.0.0 --wsport 8546 --wsorigins "*" \
	      --maxpeers 30 --cache 2048
