#! /bin/bash
# WSL环境下
EX=../adb.exe

# 几瓶体力药
if [ ! $1 ]; then
    count=3
else
    count=$1
fi

if [ ! $2 ]; then
    offset=0
else
    offset=$2
fi

# Usage:
#  ./re0_waterfall.sh 30


for ((k=1; k<=$count; k++)); do
    echo "#第$k次大瀑布挑战"
    # 只有3次最合适，好像有防刷机制，swipe拖动的距离有几率是变动的
    for ((i=1; i + $offset <= 3; i++)); do
        echo $i th
        $EX shell input tap 221 430
        sleep 2
        $EX shell input tap 212 530
        sleep 12
        $EX shell input tap 859 103
        sleep 2
        $EX shell input tap 1102 660
        sleep 120
        $EX shell input tap 1075 622
        sleep 3
        $EX shell input tap 1044 621
        sleep 5
        # $EX shell input tap 569 434

        if [ $(( ($i + $offset) % 3 ))  = 0 ] ; then
            $EX shell input tap 650 570
            sleep 3
            echo "#领取整除3奖励"
        fi

        # 滚动
        for ((j=0; j<$i; j++)); do
            $EX shell input swipe 350 550 152 550
            sleep 5
        done
        echo "#滚动"
    done

    offset=0

    # 9个和10个对手的时候不一样

    # 第7次滚动，拉到底
    # 10已经到底

    # for ((i=9; i>6; i--)); do
    #     echo $i th
    #     # 点击VS
    #     ../adb.exe shell input tap 1130 440
    #     sleep 1
    #     # 点击GO
    #     ../adb.exe shell input tap 1130 540
    #     sleep 2
    #     # 点击2号队伍
    #     ../adb.exe shell input tap 1116 664
    #     sleep 240
    #     # sleep 1
    #     # 返回
    #     # $EX shell input tap 61 26
    #     # sleep 1
    #     # 胜利界面
    #     $EX shell input tap 1061 620
    #     sleep 2
    #     # 点击退出
    #     $EX shell input tap 1061 620
    #     sleep 5
    #     # 倒过来拉取
    #     # 9）
    #     # ../adb.exe shell input swipe 153 350 350 350
    #     # 10）
    #     ../adb.exe shell input swipe 156 350 350 350
    #     sleep 2
    # done

    # 5分钟后刷新的规则
    # echo sleep 305
    # sleep 305
    $EX shell input tap 1179 102
    sleep 2
    $EX shell input tap 756 477
    sleep 2
done