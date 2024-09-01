import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import os

for name in ["EBS", "EPH", "S3"]:

    pd_s = pd.read_csv(f"./data/{name}_random_tiny.csv")
    pd_l = pd.read_csv(f"./data/{name}_random_large.csv")

    a_s = np.array(pd_s['time'])
    a_l = np.array(pd_l['time'])

    a_s = a_s[1:] - a_s[:-1]
    a_l = a_l[1:] - a_l[:-1]
    print(a_s.min(), a_s.max())
    print(a_l)

    if name != "S3":
        N = 10000
    else:
        N = 100
    filt = np.ones(N)
    filt /= filt.sum()

    a_s = np.convolve(a_s, filt, mode='valid')
    a_l
    # print(a_s.min(), a_s.max(), a_s.shape)

    s_size = 2_048
    l_size = 134_217_728

    p_s = s_size / a_s
    p_l = l_size / a_l

    if not os.path.exists("./out"):
        os.mkdir("./out")

    plt.title(f"Performance vs Iterations ({name}) tiny")
    plt.plot(np.arange(p_s.shape[0]), p_s / 1e6, label="Random : 2 KB")
    plt.ylim(bottom=0)
    plt.xlabel("Iterations")
    plt.ylabel("Performance (MB/s)")
    plt.legend()
    plt.savefig(f"./out/plot_{name}_tiny.png")
    plt.clf()

    plt.title(f"Performance vs Iterations ({name}) large")
    plt.plot(np.arange(p_l.shape[0]), p_l / 1e6, label="Random : 134 MB")
    plt.xlim(0, a_l.shape[0])
    plt.ylim(bottom=0)
    plt.xlabel("Iterations")
    plt.ylabel("Performance (MB/s)")
    plt.legend()
    plt.savefig(f"./out/plot_{name}_large.png")
    plt.clf()