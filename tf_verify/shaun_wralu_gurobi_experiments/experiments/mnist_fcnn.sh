#!/bin/bash

epsilons=(
    # Doesn't run
    # 0.005
    # 0.0075
    # 0.01
    # 0.0125
    # 0.015
    # 0.016
    # 0.0165
    # 0.017


    0.0175
    0.018
    0.0185
    0.019
    0.0195
    0.02


    # Gives >50% unstable
    # 0.020
    # 0.025
    # 0.030
    # 0.035
    # 0.040
    # 0.045
    # 0.050
    # 0.055
    # 0.060
    # 0.08
    # 0.1
    # 0.12
    # 0.14
    # 0.16
    # 0.18
    # 0.2
)

for epsilon in "${epsilons[@]}"
do
    bash ~/eran/tf_verify/shaun_wralu_gurobi_experiments/models/mnist_6x100fcnnReLU.sh --epsilon $epsilon --use_wralu
    # bash ~/eran/tf_verify/shaun_wralu_gurobi_experiments/models/mnist_6x100fcnnReLU.sh --epsilon $epsilon
done

wait
