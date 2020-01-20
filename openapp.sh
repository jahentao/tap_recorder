#! /bin/bash
# WSL环境下
EX=../adb.exe
# 启动逍遥安卓模拟器
MEmu="/mnt/g/Microvirt/MEmu/MEmu.exe"
# 后台运行逍遥安卓模拟器
$MEmu &
# 等待启动
echo "启动逍遥安卓模拟器"
sleep 20
# 连接adb
$EX connect 127.0.0.1:21503
echo "连接adb"
# 已经提前准备好了720*1080的手机，并且安装了游戏
# 目前是竖屏模式
# 点开游戏App
$EX shell input tap 106 379
echo "打开从零开始的异世界生活游戏"
# 等待加载完备，TODO加确认机制
sleep 20
# 变成横屏模式
# 关闭系统公告
$EX shell input tap 1151 100
sleep 5
# 新启动的机器，应该会让选择登陆方式
# TODO 但有的时候与上次登陆记录，会直接登陆，如何CV识别加确认机制
# 选择小米登陆
$EX shell input tap 446 344
sleep 5
# 通过账号密码登陆
# 此处机密，不要Git push上去
# 点击邮箱/手机号/小米ID
# 输入
$EX shell input tap 574 183
$EX shell input text phone
# 点击密码
$EX shell input tap 515 277
# 输入密码
$EX shell input text password
# 点击登陆
$EX shell input tap 626 367
echo "通过小米账号用户名和密码登陆"

# 等待加载完备，进入游戏界面，TODO加确认机制
sleep 20
# 关闭游戏公告
$EX shell input tap 1151 100

# 当前位置，位于游戏主界面