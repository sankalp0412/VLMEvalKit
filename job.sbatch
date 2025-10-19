#!/bin/bash
#SBATCH --job-name=vlm-eval
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=sankalp.dhupar@dfki.de
#SBATCH --time=08:00:00
#SBATCH --mem=80000
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:4
#SBATCH --partition=A100-80GB,A100-40GB,batch
#SBATCH --container-mounts=/netscratch/$USER:/netscratch/$USER,/ds:/ds:ro,"$(pwd)":"$(pwd)",/home/$USER:/home/$USER
#SBATCH --container-image=/netscratch/$USER/CreativityInVLMs/creativity.sqsh
#SBATCH --container-workdir="$(pwd)"

torchrun --nproc-per-node=4 run.py \
  --model Qwen2.5-VL-7B-Instruct \
  --data Creation_MMBench \
  --judge meta-llama/Llama-3.3-70B-Instruct \
  --verbose \
  --judge-args '{"dual_eval": false, "nproc":1, "use_hyperbolic": true}'
