docker run --name bidreq-sim  -v $(pwd)/rtb_exchange_sim:/root/rtb_exchange_sim -t pablin87/bid-request-simulator

docker stop bidreq-sim
docker rm bidreq-sim
