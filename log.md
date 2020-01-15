
## Data

- len: hangzhou 17.5h; shenzhen 16.5h
- len*(60/interval) timestamps
- (timestamps - n_frame + 1) windows
- 15 5 5 / 18 6 6 train val test
- batch = (15*windows) / batch_size 

## Experiments

### 深圳

| interval | MAE | RMSE | MAPE(%) |
| -- | -- | -- | -- |
| 10 | 15.452 | 26.344 | 26.405 |
| 15 | 17.710 | 28.652 | 21.720 |
| 30 | 30.280 | 49.924 | 20.126 |
| 45 | 49.928 | 86.805 | 20.656 |

### 杭州

| interval | MAE | RMSE | MAPE(%) |
| -- | -- | -- | -- |
| 10 |  22.267 | 36.425 | 19.437 |
| 15 |  25.344 | 41.013 | 15.123 |
| 30 |  38.721 | 59.152 | 12.049 |
| 45 |  49.928 | 86.805 | 20.656 |

## NOTE

- 代码无法用更少的历史数据：因为卷积核大小为3
