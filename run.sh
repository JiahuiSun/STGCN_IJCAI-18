st=`date +"%y-%m-%d %H:%M:%S"`
log_path='./output/result'
ding="https://oapi.dingtalk.com/robot/send?access_token=73ca935dc328720564d2aeefb13f720d4a4e2b2d67fc518ae2cd42e3f02751c0"

if [ ! -d ${log_path} ]; then
    mkdir -p ${log_path}
fi

python main.py >> ${log_path}/STGCN.log 2>&1

end=`date +"%y-%m-%d %H:%M:%S"`

conf="SJH\nstart time: $st\nend time: $end\n"
curl ${ding} -H "Content-Type: application/json" -d "{'msgtype': 'text', 'text':{'content': '$conf'}}"
