#! /bin/bash
# WSL环境下
EX=../adb.exe

# 在横屏模式下，手机模式 720*1080
# [tap_recorder] ../adb.exe shell getevent -p | grep -e "0035" -e "0036"                                    master  ✗ ✭ ✱
#                 0031  0032  0033  0034  0035  0036  0037  0038
#                 0035  : value 0, min 0, max 720, fuzz 0, flat 0, resolution 0
#                 0036  : value 0, min 0, max 1280, fuzz 0, flat 0, resolution 0
#                 0031  0032  0033  0034  0035  0036  0037  0038

sleep_time=3
fight_time=120
# 几瓶体力药
if [ ! $1 ]; then
    drug_num=3
else
	drug_num=$1
fi

# 刷金币任务数
if [ ! $2 ]; then
    jinbirenwushu=2
else
	jinbirenwushu=$2
fi
# 金币刷本时间
# 发现团队的等级提升之后，刷本的时间也会变化，设置的时间偏小不能应对这种变化，同时还要注意有没有队伍的变化
jinbi_time=180

# 刷经验任务数
if [ ! $3 ]; then
    jingyanrenwushu=2
else
	jingyanrenwushu=$3
fi
# 经验刷本时间
jingyan_time=120

# 是否起始时加体力
if [ ! $4 -o $4 == "true" ]; then
    addstrength=true
else
	addstrength=false
fi
# echo $addstrength

# 命令使用示例：
# ./re0_record.sh 4 1 3 false

# 几个点一一调试如下：
# 开始游戏后关闭提示框 ×
# $EX shell input tap 1155 116
# sleep $sleep_time

# 从游戏主界面开始
# 点击故事
$EX shell input tap 1108 396
sleep $sleep_time
# 点击日常
$EX shell input tap 68 248
sleep $sleep_time

# 默认当前已经进入 日常选项卡 游戏界面

consume_num=1
for ((k=1; k<=$drug_num; k++)); do
	if [ $addstrength = false ]; then
		addstrength=true
	else
		# 点击加体力
		$EX shell input tap 759 36
		sleep $sleep_time
		# 点击使用药品加体力
		$EX shell input tap 759 486
		sleep $sleep_time
		echo "消耗$consume_num瓶体力药"
		let consume_num++
		# 点击空白处
		$EX shell input tap 671 585
		sleep $sleep_time
	fi

    if [ $jinbirenwushu -gt 0 ]; then
    	jinbi_k=1
		# 点击金币任务，看情况，第一次进入任务界面需要，之后退出选择经验任务也需要
		$EX shell input tap 732 405
		sleep $sleep_time

		# 点击进阶者任务
		# $EX shell input tap 1171 499
		# 点击高手任务
		$EX shell input tap 1171 596
		sleep $sleep_time
		# 点击开始战斗
		$EX shell input tap 960 617
		sleep $sleep_time
		# 点击开始挑战
		$EX shell input tap 948 562
		sleep $sleep_time
		# 点击选择的默认队伍，开始挑战
		$EX shell input tap 1116 664

		# 等待2分钟(目前的队伍战斗水平)，战斗结束。以上每一步等待3秒
		sleep $jinbi_time

		echo "刷金币任务$jinbi_k"
		let jinbi_k++

		# 次数判断，指定次数内，继续挑战
		while (( $jinbi_k <= $jinbirenwushu ))
		do
			# 胜利界面，点击画面继续
			$EX shell input tap 747 425
			sleep $sleep_time

			# 点击再次挑战
			$EX shell input tap 256 626
			sleep $sleep_time

			# 等待2分钟(目前的队伍战斗水平)，战斗结束。以上每一步等待3秒
			sleep $jinbi_time

			echo "刷金币任务$jinbi_k"
			let jinbi_k++
		done

		# 胜利界面，点击画面继续
		$EX shell input tap 747 425
		sleep $sleep_time

		# 超过指定次数，点击退出关卡
		$EX shell input tap 1061 620
		sleep $sleep_time

		# 点击返回按钮
		$EX shell input tap 61 26
		sleep $sleep_time
    fi


    

	jingyan_k=1
	# 点击经验任务
	$EX shell input tap 1083 408
	sleep $sleep_time
	$EX shell input tap 732 405
	sleep $sleep_time

	# 点击进阶者任务
	$EX shell input tap 1171 499
	sleep $sleep_time
	# 点击开始战斗
	$EX shell input tap 960 617
	sleep $sleep_time
	# 点击开始挑战
	$EX shell input tap 948 562
	sleep $sleep_time
	# 点击选择的默认队伍，开始挑战
	$EX shell input tap 1116 664
	sleep $sleep_time

	# 等待2分钟(目前的队伍战斗水平)，战斗结束。以上每一步等待3秒
	sleep $jingyan_time

	echo "刷经验任务$jingyan_k"
	let jingyan_k++

	# 次数判断，指定次数内，继续挑战
	while (( $jingyan_k <= $jingyanrenwushu ))
	do
		# 胜利界面，点击画面继续
		$EX shell input tap 747 425
		sleep $sleep_time

		# 点击再次挑战
		$EX shell input tap 256 626
		sleep $sleep_time

		# 等待3分钟(目前的队伍战斗水平)，战斗结束。以上每一步等待3秒
		sleep $jingyan_time

		echo "刷经验任务$jingyan_k"
		let jingyan_k++
	done

	# 胜利界面，点击画面继续
	$EX shell input tap 747 425
	sleep $sleep_time

	# 超过指定次数，点击退出关卡，
	$EX shell input tap 1061 620
	sleep $sleep_time

	# 点击返回按钮
	$EX shell input tap 61 26
	sleep $sleep_time

	# 点击重置到金币任务
	$EX shell input tap 416 401
	sleep $sleep_time
done


# 点击返回按钮
$EX shell input tap 61 26

