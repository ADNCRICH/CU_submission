from cgi import print_arguments
from xml.dom import minicompat
import numpy as np


def get_score(board):
    a = board.min(axis=1)
    return a[a != 0].size * 40
    # return sum(a != 0)*40


def get_time_cap(board, time_caps):
    a = board.max(axis=1)
    b = (a.reshape(a.size//(board.shape[0]//len(time_caps)), board.shape[0]//len(time_caps))).max(axis=1)
    c = np.where(b != 0)[0]
    if c.size > 0:
        return time_caps[c[0]]
    else:
        return time_caps[-1]


def rotate_right(shape):
    return shape.T[::, ::-1]


def rotate_left(shape):
    return shape.T[::-1, ::]


def get_position(a):
    pos = np.arange(a.shape[0])
    return pos[a != 0]


def animate_clear(board):
    # DON'T change any values in board
    N = []
    N = np.array(board)
    a0 = np.min(N, axis=1)
    if np.sum(a0) == 0:
        return N
    b0 = get_position(a0)
    N[b0] = 0
    pos_0 = get_position_0full(N)
    l = N.shape[0] - pos_0.size
    for i in range(l):
        N = np.insert(N, 0, 0, axis=0)
    return np.delete(N, pos_0+l, axis=0)


def get_position_full(board):
    ma = np.min(board, axis=1)
    r = np.arange(ma.shape[0])
    return r[ma != 0]


def get_position_0full(board):
    ma = np.max(board, axis=1)
    r = np.arange(ma.shape[0])
    return r[ma == 0]


def test_part(a, b, i, j):
    return a[i:i+b.shape[0], j:j+b.shape[1]] + b


def add_part(a, b, i, j):
    a[i:i+b.shape[0], j:j+b.shape[1]] += b
    return


def clear_part(a, b, i, j):
    a[i:i+b.shape[0], j:j+b.shape[1]] = 0
    return


def animate_drop(board, shape, c):
    a = []
    new_board = np.array(board)
    new_shape = np.array(shape)
    new_board[new_board > 0] = 1
    new_shape[new_shape > 0] = 1
    N = np.array(board)
    S = np.array(shape)
    i = 0
    while(np.max(test_part(new_board, new_shape, i, c)) == 1):
        add_part(N, S, i, c)
        Z = np.copy(N)
        a.append(Z)
        clear_part(N, S, i, c)
        i += 1
    return a


def move(board, i):
    t = np.copy(board[:i])
    board[:i] = 0
    board[1:i+1] = t
    return np.copy(board)


def animate_clear(board):
    a = []
    x = get_position_full(board)
    if(x.size == 0):
        return a
    N = np.array(board)
    N[x] = 0
    a.append(np.copy(N))
    xx = get_position_0full(N)
    for i, j in enumerate(xx[::-1]):
        a.append(move(N, i+j))
    return a


board = np.array([[0, 0, 0, 0, 0],
                  [0, 2, 0, 0, 0],
                  [0, 2, 0, 0, 0],
                  [0, 2, 0, 0, 2],
                  [0, 2, 0, 0, 2],
                  [3, 3, 2, 0, 2],
                  [3, 3, 2, 0, 2],
                  [1, 1, 2, 3, 0]])
time_caps = [120, 180, 240, 300]

shape = np.array([[3, 3, 0, 0],
                  [2, 2, 2, 6],
                  [0, 5, 5, 4],
                  [7, 7, 7, 6],
                  [0, 0, 0, 0],
                  [4, 0, 1, 1]])

print(get_time_cap(board, time_caps))
# print(animate_drop(board, shape, 0))
