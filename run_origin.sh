city=${1:-hangzhou}
n_route=${2:-81}
batch=${6:-128}
epoch=${5:-100}
n_his=${4:-10}

st=`date +"%y%m%d-%H%M"`
if [ ! -d './output/result' ]; then
    mkdir -p './output/result'
fi
out_log=./output/result/${city}_${inter}_${batch}_${n_his}.log

python main.py --n_route 228 \
               --n_his 12 \
               --epoch 100 \
               --batch_size 50 \
               --graph 'default'
