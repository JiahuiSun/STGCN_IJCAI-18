city=${1:-shenzhen}
n_route=${2:-165}
inter=${3:-30}
batch=${4:-50}
epoch=${5:-100}
n_his=${6:-10}

st=`date +"%y%m%d-%H%M"`
if [ ! -d './output/result' ]; then
    mkdir -p './output/result'
fi
out_log=./output/result/${city}_${inter}_${batch}_${n_his}.log

python main.py --n_route ${n_route} \
               --interval ${inter} \
               --n_his ${n_his} \
               --epoch ${epoch} \
               --batch_size ${batch} \
               --graph ${city}_metro_roadmap.csv >> ${out_log} 2>&1
