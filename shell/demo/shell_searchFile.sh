#! /bin/sh  
#测试echo、位置变量  
# ls
# echo hello
# echo "\$* is $*"
# echo "\$@ is $@"
# echo "\$# is $#"
# date

arr=$(ls)
temp=iOS
# echo $arr
for i in $arr
	do 
	result=$(echo $i | grep "$temp")
	if [[ "$result" != "" ]] 
	then
		echo $i
	fi
done


# strA="long string"
# strB="string"
# result=$(echo $strA | grep "${strB}")
# if [[ "$result" != "" ]]
# then
#     echo "包含"
# else
#     echo "不包含"
# fi