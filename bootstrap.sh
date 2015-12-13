wget http://www.multichain.com/download/multichain-1.0-alpha-9.tar.gz
tar -xvzf multichain-1.0-alpha-9.tar.gz
cd multichain-1.0-alpha-9

./multichain-util create NoFrontieres
./multichaind NoFrontieres -daemon

# http://www.multichain.com/developers/peer-handshaking/#bitcoin
# http://www.multichain.com/developers/creating-connecting/#bitcoin-style