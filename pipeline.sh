#! /bin/bash
# WSL环境下

# 应用本地修改的用户名密码
git stash apply
./openapp.sh

# 2*30+2*25=110
./re0_record.sh 0 1 3 false
# ./re0_record.sh 10 2 2