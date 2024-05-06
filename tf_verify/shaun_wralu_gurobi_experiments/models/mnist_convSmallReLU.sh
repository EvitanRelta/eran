#!/bin/bash

epsilon=0.08
imgid=4
use_wralu=false

# Parse command line arguments
while [[ $# -gt 0 ]]
do
    key="$1"
    case $key in
        --epsilon)
            epsilon="$2"
            shift 2
            ;;
        --imgid)
            imgid="$2"
            shift 2
            ;;
        --use_wralu)
            use_wralu=true
            shift
            ;;
        *)
            echo "Unknown argument: $1"
            exit 1
            ;;
    esac
done

source /home/yuyi/loris5/PRIMA/venv_3dot8/bin/activate
cd ~/eran/tf_verify

if $use_wralu; then
    bounds_save_path="./shaun_wralu_gurobi_experiments/results/wralu/mnist_convSmallReLU_epsilon=${epsilon}_imgid=${imgid}_domain=refinepoly.pkl"
    python Grena_runone_image.py \
        --use_wralu \
        --netname ./GPUARENA/tested_network/convSmallRELU__Point.onnx \
        --dataset mnist \
        --epsilon $epsilon \
        --imgid $imgid \
        --domain refinepoly \
        --bounds_save_path "$bounds_save_path"
else
    bounds_save_path="./shaun_wralu_gurobi_experiments/results/original/mnist_convSmallReLU_epsilon=${epsilon}_imgid=${imgid}_domain=refinepoly.pkl"
    python Grena_runone_image.py \
        --netname ./GPUARENA/tested_network/convSmallRELU__Point.onnx \
        --dataset mnist \
        --epsilon $epsilon \
        --imgid $imgid \
        --domain refinepoly \
        --bounds_save_path "$bounds_save_path"
fi
