
n_route=$1
inter=$2
n_his=$3

if [ ! -d './output/result' ]; then
    mkdir -p './output/result'
fi

python main.py --n_route ${n_route} --interval ${inter} --n_his ${n_his} --epoch 100 >> hangzhou.log 2>&1
