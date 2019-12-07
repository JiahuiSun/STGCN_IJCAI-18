### Parameters
- 17.5*(60/interval)=105 timesteps
- 105 - n_frame + 1 windows
- 15 5 5 train val test
- 15*windows all windows
- batch = (all windows) / batch_size 

### Experiments
1. 
n_pred=10, lr=0.001
| batch size | MAPE | MAE | RMSE |
| --- | --- | --- | --- |
| 16  | 4.106 | 10.242 | 15.177 |
| 32  | 6.971 | 24.476 | 47.421 |
| 50  | 9.344 | 32.533 | 55.894 |
| 64  | 9.517 | 37.436 | 86.654 |
| 128 | 12.189 | 45.324 | 87.714 |
| 256 | 14.089 | 65.057 | 213.309 |

### TODO
- 代码无法用更少的历史数据预测
- batch越小RMSE越小？
- 输出的是什么含义？
