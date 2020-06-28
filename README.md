# blockchain_nodes

# 启动ltc服务
sudo docker run -p 8034:8034 -p 9334:9333 -p 38334:38334 -v /home/wangzelin/workspace/coins/ltc/data/:/root/litecoin/:rw -itd  ltc:v1

# 启动btc服务
sudo docker run -p 8030:8030 -p 8334:8333 -p 38330:38330 -v /home/wangzelin/workspace/coins/btc/data/:/root/bitcoin-core:rw -itd  btc:v1

# 启动bch服务
sudo docker run -p 8031:8031 -p 8335:8333 -p 38331:38331 -v /home/wangzelin/workspace/coins/bch/data/:/root/bitcoin-abc:rw -itd  bch:v1

# 启动bsv服务
sudo docker run -p 8046:8046 -p 8336:8333 -p 38346:38346 -v /home/wangzelin/workspace/coins/bsv/data/:/root/bitcoin-sv:rw -itd  bsv:v1

# 启动usdt服务
sudo docker run -p 8332:8332 -p 8336:8333 -p 38337:38337 -v /home/wangzelin/workspace/coins/usdt/data/:/root/usdt:rw -itd  usdt:v1

# 启动geth服务
sudo docker run -p 8036:8036  -p 30303:30303 -p 8546:8546 -v /home/wangzelin/workspace/coins/eth/data/:/root/ethereum:rw -itd  eth:v1
