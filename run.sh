city=${1:-hangzhou}
n_route=${2:-81}
inter=${3:-30}
n_his=${4:-10}
epoch=${5:-100}

st=`date +"%y%m%d-%H%M"`
if [ ! -d './output/result' ]; then
    mkdir -p './output/result'
fi
out_log=./output/result/${st}.log

python main.py --n_route ${n_route} \
               --interval ${inter} \
               --n_his ${n_his} \
               --epoch ${epoch} \
               --graph ${city}_metro_roadmap.csv >> ${out_log} 2>&1
