#!/usr/bin/env bash

source EXPERIMENTS_ROOT.sh


run_DEMO_EXPERIMENTS()
{
  RESULTS_PATH=$1; shift
  SAVE_IMAGES=$1; shift
  GPUS=($@)

  # best results on KolektorSDD2 dataset
  train_single $SAVE_IMAGES KSDD2 $KSDD2_PATH synthetic_mixed_246_2 $RESULTS_PATH 15 -1 .\\splits\\KSDD2\\split_246_synthetic_mixed.pyb 50 0.01 1 10 True  2 3 True  True  True  ${GPUS[0]}
  train_single $SAVE_IMAGES KSDD2 $KSDD2_PATH synthetic_normal_246_2 $RESULTS_PATH 15 -1 .\\splits\\KSDD2\\split_246_synthetic_normal.pyb 50 0.01 1 10 True  2 3 True  True  True  ${GPUS[0]}
  train_single $SAVE_IMAGES KSDD2 $KSDD2_PATH synthetic_monochrome_246_2 $RESULTS_PATH 15 -1 .\\splits\\KSDD2\\split_246_synthetic_monochrome.pyb 50 0.01 1 10 True  2 3 True  True  True  ${GPUS[0]}

}

# Space delimited list of GPU IDs which will be used for training
GPUS=($@)
if [ "${#GPUS[@]}" -eq 0 ]; then
  GPUS=(0)
  #GPUS=(0 1 2) # if more GPUs available
fi
run_DEMO_EXPERIMENTS   ./results True "${GPUS[@]}"
