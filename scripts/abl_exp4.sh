#!/bin/bash
#SBATCH -J abl_exp24       # 作业名为 test
#SBATCH -o abl_exp24.out   # 屏幕上的输出⽂件重定向到 test.out
#SBATCH -p compute    # 作业提交的分区为 compute
#SBATCH -N 1          # 作业申请 1 个节点
#SBATCH -t 05:00:00    # 任务运⾏的最⻓时间为 1 ⼩时
#SBATCH --gres=gpu:a100-pcie-40gb:1 # 申请GPU
#SBATCH -w gpu15      # 指定运⾏作业的节点是 gpu06，若不填写则不指定

# 输入要执行的命令，例如 ./hello 或 python test.py 等
python /home/bqqi/lifelong_research/src/CL_Transformer/utils/main.py --model onlinevt --load_best_args --dataset seq-imagenet-r --buffer_size 600  --csv_log --with_brain_vit --num_classes 200 --num_workers 12 --kappa 2 --lmbda 0.1 --delta 0.01 --k 2 --with_slow > ablation_exp/exp2/imr_k_2.log 2>&1
python /home/bqqi/lifelong_research/src/CL_Transformer/utils/main.py --model onlinevt --load_best_args --dataset seq-imagenet-r --buffer_size 600  --csv_log --with_brain_vit --num_classes 200 --num_workers 12 --kappa 2 --lmbda 0.1 --delta 0.01 --k 3 --with_slow > ablation_exp/exp2/imr_k_3.log 2>&1
# python /home/bqqi/lifelong_research/src/CL_Transformer/utils/main.py --model onlinevt --load_best_args --dataset seq-imagenet-r --buffer_size 600  --csv_log --with_brain_vit --num_classes 200 --num_workers 12 --kappa 2 --lmbda 0.1 --delta 0.01 --k 4 --with_slow > ablation_exp/exp2/imr_k_4.log 2>&1
# python /home/bqqi/lifelong_research/src/CL_Transformer/utils/main.py --model onlinevt --load_best_args --dataset seq-imagenet-r --buffer_size 600  --csv_log --with_brain_vit --num_classes 200 --num_workers 12 --kappa 2 --lmbda 0.1 --delta 0.01 --k 5 --with_slow > ablation_exp/exp2/imr_k_5.log 2>&1