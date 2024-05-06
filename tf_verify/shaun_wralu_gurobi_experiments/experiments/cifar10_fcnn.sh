#!/bin/bash

epsilons=(
    # Doesn't run
    # 0.001
    # 0.0011

    0.00115
    0.0012
    0.00125
    0.0013
    0.00135
    0.0014
    0.00145
    0.0015
    # 0.002

    # 0.0025
    # 0.003
    # 0.0035
)

for epsilon in "${epsilons[@]}"
do
    bash ~/eran/tf_verify/shaun_wralu_gurobi_experiments/models/cifar10_6x100fcnnReLU.sh --epsilon $epsilon --use_wralu &
    bash ~/eran/tf_verify/shaun_wralu_gurobi_experiments/models/cifar10_6x100fcnnReLU.sh --epsilon $epsilon &
done

wait
