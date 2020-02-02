#! /bin/bash
# WSL环境下
EX=../adb.exe
# 1280*720
#当前是横屏模式，读取testclick文件，执行1次
sleep_time=5
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

# 是否起始时加体力
if [ ! $3 -o $3 == "true" ]; then
    addstrength=true
else
	addstrength=false
fi

# Usage:
#  ./re0_dangcing_girl_A5.sh 4 6 false

consume_num=1
for ((k=1; k<=$drug_num; k++)); do
	if [ $addstrength = false ]; then
		addstrength=true
	else
		# 点击加体力
		$EX shell input tap 810 36
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
        $EX shell input tap 794 225
		sleep $sleep_time
		$EX shell input tap 1064 632
		sleep $sleep_time
		$EX shell input tap 866 104
		sleep $sleep_time
		$EX shell input tap 1107 657
		sleep 210
		$EX shell input tap 1091 640
		sleep $sleep_time
		$EX shell input tap 1036 622
		sleep $sleep_time
		$EX shell input tap 830 418
		sleep $sleep_time
        echo "刷金币任务$jinbi_k"
        let jinbi_k++

        # 次数判断，指定次数内，继续挑战
		while (( $jinbi_k <= $jinbirenwushu ))
		do
			$EX shell input tap 794 225
			sleep $sleep_time
			$EX shell input tap 1064 632
			sleep $sleep_time
			$EX shell input tap 866 104
			sleep $sleep_time
			$EX shell input tap 1107 657
			sleep 210
			$EX shell input tap 1091 640
			sleep $sleep_time
			$EX shell input tap 1036 622
			sleep $sleep_time
			$EX shell input tap 830 418
			sleep $sleep_time
			echo "刷金币任务$jinbi_k"
			let jinbi_k++
		done
		
	fi
done