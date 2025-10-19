srun --job-name=vlm-eval \
  --mail-type=BEGIN,END,FAIL \
  --mail-user=sankalp.dhupar@dfki.de \
  --time=06:00:00 --immediate=300 \
  --mem=80000 \
  --cpus-per-task=1 \
  --gres=gpu:1 \
  --partition=A100-80GB \
  --container-mounts=/netscratch/$USER:/netscratch/$USER,/ds:/ds:ro,"`pwd`":"`pwd`",/home/$USER:/home/$USER \
  --container-image=/netscratch/$USER/CreativityInVLMs/creativity.sqsh \
  --container-workdir="`pwd`" \
  torchrun --nproc-per-node=1 run.py \
    --model Qwen2.5-VL-7B-Instruct \
    --data Creation_MMBench \
    --judge meta-llama/Llama-3.3-70B-Instruct \
    --api-nproc=1 \
    --verbose \
    --judge-args '{"retry":1 , "use_hyperbolic": true}'