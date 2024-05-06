#!/bin/bash

epsilons=(
    # Doesn't run
    # 0.0045
    # 0.005
    # 0.0055


    0.006
    0.0065
    0.007
    0.0075
)

for epsilon in "${epsilons[@]}"
do
    bash ~/eran/tf_verify/shaun_wralu_gurobi_experiments/models/cifar10_convMedReLU.sh --epsilon $epsilon --use_wralu &
    bash ~/eran/tf_verify/shaun_wralu_gurobi_experiments/models/cifar10_convMedReLU.sh --epsilon $epsilon &
done

wait
