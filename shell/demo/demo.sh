#!/bin/bash  
  
for i in "1" "2" "3" "4" "5" "6" "7" "8" "9"
do
	for j in "1" "2" "3" "4" "5" "6" "7" "8" "9"
	do
		if [ ${j} -lt  ${i} ]
		then
			 k=$((i * j))
			 echo -n ${i}*${j}=${k}$'\t'
		 fi
		 if [ ${j} -eq ${i} ]
		 then
			 k=$((i * j))
			 echo   ${i}*${j}=${k}
		 fi
	 done
done

# cd ~
# cd Desktop/HQ1.1Doc/UI/00Product_release
# svn up