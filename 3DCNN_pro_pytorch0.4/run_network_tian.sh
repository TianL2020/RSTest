#!/bin/bash

###################
# TRAINING CONFIG #
###################

export ROOT="."
# export ROOT="/home/tian/Documents/AAU_Project/Code/aau_test/3DCNN/"
export LABELS="Crossing1_laser_binary.json"
export IS_CROPPED="--is_cropped"  # Uncomment to crop input images
export CROP_SIZE="112 112"
export BATCHSIZE="32" # 128
export VAL_BATCHSIZE="4" # 4
export FRAMES="16"
export SHUFFLE="--shuffle"
export FCN="--FCN"
#export FCN="true"
export NORMALIZE="--normalized"
export RANDOM_FLIP="--random_flip"
export COLOR_SPACE="RGB"
export DIM_ORDER="cfhw"
export LR="0.01"
export MOMENTUM="0.9"
export WEIGHT_DECAY="1e-4"
export STEP_SIZE="5"
export GAMMA="0.1"
export EPOCHS="20" #20 90
export ARCH="c3d"
export NUM_CLASSES="2"
export OUTPUT="./results/`date +%b%d_%H-%M-%S`"
export PRINTFREQ="50"
export STRIDE="8"
#export GPU_ID="0" #tian GPU_ID to be used


echo $OUTPUT

tensorboard --logdir runs 2> /dev/null &# $OUTPUT 2> /dev/null &
echo "Tensorboard launched"
# python /content/drive/My\ Drive/AAU/3DCNN/main.py --root "/content/drive/My Drive/AAU/3DCNN/" --label_json $LABELS --batchsize $BATCHSIZE --val_batchsize $VAL_BATCHSIZE --frames $FRAMES $IS_CROPPED --crop_size $CROP_SIZE $SHUFFLE $NORMALIZE $RANDOM_FLIP --color_space $COLOR_SPACE --dimension_order $DIM_ORDER --lr $LR --momentum $MOMENTUM --epochs $EPOCHS --arch $ARCH --num_classes $NUM_CLASSES --weight-decay $WEIGHT_DECAY --output $OUTPUT $FCN $SINGLE_GPU --print-freq $PRINTFREQ --stride $STRIDE --step_size $STEP_SIZE --gamma $GAMMA 
python main.py --root $ROOT --label_json $LABELS --batchsize $BATCHSIZE --val_batchsize $VAL_BATCHSIZE --frames $FRAMES $IS_CROPPED --crop_size $CROP_SIZE $SHUFFLE $NORMALIZE $RANDOM_FLIP --color_space $COLOR_SPACE --dimension_order $DIM_ORDER --lr $LR --momentum $MOMENTUM --epochs $EPOCHS --arch $ARCH --num_classes $NUM_CLASSES --weight-decay $WEIGHT_DECAY --output $OUTPUT $FCN $SINGLE_GPU --print-freq $PRINTFREQ --stride $STRIDE --step_size $STEP_SIZE --gamma $GAMMA 

#--gpu $GPU_ID






