city=${1:-hangzhou}
n_route=${2:-81}
batch=${3:-128}
epoch=${4:-100}
n_his=${5:-10}

st=`date +"%y%m%d-%H%M"`
if [ ! -d './output/result' ]; then
    mkdir -p './output/result'
fi
out_log=./output/result/${city}_${inter}_${batch}_${n_his}.log

python main.py --n_route 228 \
               --n_his 12 \
               --epoch 50 \
               --batch_size 10 \
               --graph 'default'
