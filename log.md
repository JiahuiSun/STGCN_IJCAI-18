### Parameters
- len: hangzhou 17.5h; shenzhen 16.5h
- len*(60/interval) timestamps
- (timestamps - n_frame + 1) windows
- 15 5 5 train val test
- batch = (15*windows) / batch_size 

### Experiments
1. n_pred=10, lr=0.001, interval=30

| batch size | MAPE | MAE | RMSE |
| --- | --- | --- | --- |
| 16  | 4.106 | 10.242 | 15.177 |
| 32  | 6.971 | 24.476 | 47.421 |
| 50  | 9.344 | 32.533 | 55.894 |
| 64  | 9.517 | 37.436 | 86.654 |
| 128 | 12.189 | 45.324 | 87.714 |
| 256 | 14.089 | 65.057 | 213.309 |

### TODO
- 代码无法用更少的历史数据预测：因为卷积核大小为3
- batch越小RMSE越小？
- Time Step 1: MAPE  9.517%,  9.517%; MAE  37.436, 37.436; RMSE 86.654, 86.654. 后两项总是一样什么含义？
