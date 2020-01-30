#! /bin/bash
# WSL环境下
EX=../adb.exe

for ((i=1; i<7; i++)); do
    echo $i th
    # 1st
    # 点击战斗
    # 9）
    # ../adb.exe shell input tap 250 450
    # 10）
    ../adb.exe shell input tap 231 420
    sleep 1
    # 再点击Go
    # 9）
    # ../adb.exe shell input tap 250 550
    # 10）
    ../adb.exe shell input tap 231 520
    sleep 2
    # 默认点击2号队伍
    # ../adb.exe shell input tap 1116 664
    # sleep 100
    # sleep 1
    # 返回
    $EX shell input tap 61 26
    sleep 1
    # 胜利界面
    # $EX shell input tap 1061 620
    # sleep 2
    # 点击退出
    # $EX shell input tap 1061 620
    # sleep 5
    # 滚动
    ../adb.exe shell input swipe 350 350 153 350
    sleep 2
done

# 9个和10个对手的时候不一样

# 第7次滚动，拉到底
# 10已经到底

for ((i=9; i>6; i--)); do
    echo $i th
    # 点击VS
    ../adb.exe shell input tap 1130 440
    sleep 1
    # 点击GO
    ../adb.exe shell input tap 1130 540
    sleep 2
    # 点击2号队伍
    # ../adb.exe shell input tap 1116 664
    # sleep 240
    # sleep 1
    # 返回
    $EX shell input tap 61 26
    sleep 1
    # 胜利界面
    # $EX shell input tap 1061 620
    # sleep 2
    # 点击退出
    # $EX shell input tap 1061 620
    # sleep 5
    # 倒过来拉取
    # 9）
    # ../adb.exe shell input swipe 153 350 350 350
    # 10）
    ../adb.exe shell input swipe 156 350 350 350
    sleep 2
done

# 5分钟后刷新的规则
# sleep 300
