for batch in 16 32 64 128 256
do
    for inter in 10 15 30 45
    do
        sh run.sh hangzhou 81 ${inter} ${batch}
    done
done

for batch in 16 32 64 128 256
do
    for inter in 10 15 30 45
    do
        sh run.sh shenzhen 165 ${inter} ${batch}
    done
done

# for i in 10 15 30 45
# do
#     sh run.sh hangzhou 81 ${i}
# done

# for j in 10 15 30 45
# do
#     sh run.sh shenzhen 165 ${j}
# done
