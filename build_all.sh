
if [ ! -d "rtb_exchange_sim" ]; then
  git clone https://github.com/pablin87/rtb_exchange_sim.git
  cd rtb_exchange_sim
  git submodule update --init
  cd ..
fi

docker build -t "pablin87/bid-request-simulator" -f Dockerfile .
