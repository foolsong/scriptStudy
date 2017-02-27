#! /bin/sh  
cd ~ 
cd /Users/songyongjian/Desktop
arr=$(ls)
temp='iOS'
# echo $arr
for i in $arr
	do 
	result=$(echo $i | grep "$temp")
	# echo result = $result
	if [[ "$result" != "" ]] 
	then
		echo $i
	fi
done