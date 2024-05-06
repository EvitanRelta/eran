#!/bin/bash

epsilons=(
    # Doesn't run
    # 0.8

    0.1
    0.12
    0.14
    0.16
    0.18
    0.2
    0.22
    0.24
)

for epsilon in "${epsilons[@]}"
do
    bash ~/eran/tf_verify/shaun_wralu_gurobi_experiments/models/mnist_convSmallReLU.sh --epsilon $epsilon --use_wralu &
    bash ~/eran/tf_verify/shaun_wralu_gurobi_experiments/models/mnist_convSmallReLU.sh --epsilon $epsilon &
done

wait
