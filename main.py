# @Time     : Jan. 02, 2019 22:17
# @Author   : Veritas YIN
# @FileName : main.py
# @Version  : 1.0
# @Project  : Orion
# @IDE      : PyCharm
# @Github   : https://github.com/VeritasYin/Project_Orion

import os

os.environ["CUDA_VISIBLE_DEVICES"] = "1"
from os.path import join as pjoin
import numpy as np
import tensorflow as tf

np.random.seed(1)
tf.set_random_seed(1)

config = tf.ConfigProto()
config.gpu_options.allow_growth = True
tf.Session(config=config)

from utils.math_graph import *
from data_loader.data_utils import *
from models.trainer import model_train
from models.tester import model_test

import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--n_route', type=int, default=81)
parser.add_argument('--interval', type=int, default=10)
parser.add_argument('--n_his', type=int, default=10)
parser.add_argument('--n_pred', type=int, default=1)
parser.add_argument('--batch_size', type=int, default=256)
parser.add_argument('--epoch', type=int, default=50)
parser.add_argument('--save', type=int, default=2)
parser.add_argument('--ks', type=int, default=3)
parser.add_argument('--kt', type=int, default=3)
parser.add_argument('--lr', type=float, default=1e-3)
parser.add_argument('--opt', type=str, default='RMSProp')
parser.add_argument('--graph', type=str, default='default')
parser.add_argument('--inf_mode', type=str, default='sep')

args = parser.parse_args()
print(f'Training configs: {args}')

n, n_his, n_pred = args.n_route, args.n_his, args.n_pred
Ks, Kt = args.ks, args.kt
# blocks: settings of channel size in st_conv_blocks / bottleneck design
blocks = [[1, 32, 64], [64, 32, 128]]

# Load wighted adjacency matrix W
if args.graph == 'default':
    W = weight_matrix(pjoin('./dataset', f'PeMSD7_W_{n}.csv'))
else:
    # load customized graph weight matrix
    W = weight_matrix(pjoin('./dataset', args.graph))

# Calculate graph kernel
L = scaled_laplacian(W)
# Alternative approximation method: 1st approx - first_approx(W, n).
Lk = cheb_poly_approx(L, Ks, n)
tf.add_to_collection(name='graph_kernel', value=tf.cast(tf.constant(Lk), tf.float32))

# day_slot = 288
# data_file = f'PeMSD7_V_{n}.csv'
# n_train, n_val, n_test = 34, 5, 5

interval = args.interval
if args.n_route == 81:
    data_file = 'hangzhou_metro_20190101_20190125_int%d.csv'%interval
    day_slot = int(17.5 * 60 / interval)
    n_train, n_val, n_test = 15, 5, 5
elif args.n_route == 165:
    data_file = 'shenzhen_metro_20170601_20170630_int%d.csv'%interval
    day_slot = int(16.5 * 60 / interval)
    n_train, n_val, n_test = 18, 6, 6
else:
    raise ValueError(f'ERROR: "{args.n_route}" is wrong station number.')

PeMS = data_gen(pjoin('./dataset', data_file), (n_train, n_val, n_test), n, n_his + n_pred, day_slot=day_slot)
print(f'>> Loading dataset with Mean: {PeMS.mean:.2f}, STD: {PeMS.std:.2f}')

if __name__ == '__main__':
    model_train(PeMS, blocks, args)
    model_test(PeMS, PeMS.get_len('test'), n_his, n_pred, args.inf_mode)
