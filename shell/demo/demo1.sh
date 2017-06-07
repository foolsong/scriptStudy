#版本2.0，增加了函数和swtich分支，增加了6个命令选项到9个，2016/11/28

#--------配置路径
cleanServicePath="/Users/bigbear/AndroidStudioProjects/service/hqyxjy-clientapi-doc"
cleanProductPath="/Users/bigbear/svn/00Product_release"

#--------初始化一些变量
isServiceUpdateSuccess=0
isProductUpdateSuccess=0

#--------------------------------------------------------start:定义几个函数----------------------------------------------------------------
#--------更新接口文档函数
updateServiceDoc(){

currentDate=`date '+%m-%d %H:%M'`
result=`cd ${cleanServicePath}`
if [ $? -eq 1 ]; then
osascript -e "display notification \"$cleanServicePath\" with title \"接口文档路径错误！已停止更新！at:$currentDate\""
exit
fi

osascript -e "display notification \"$cleanServicePath\" with title \"开始更新接口文档...at:$currentDate\""

cd ${cleanServicePath}
result=`git pull origin develop`
isServiceUpdateSuccess=$?
if [ $isServiceUpdateSuccess -eq 0 ]; then
currentDate=`date '+%m-%d %H:%M'`
osascript -e "display notification \"$result\" with title \"更新接口文档成功！at:$currentDate\""
elif [ $isServiceUpdateSuccess -eq 1 ];then
currentDate=`date '+%m-%d %H:%M'`
osascript -e "display notification \"$result\" with title \"更新接口文档失败！at:$currentDate\""
fi

}

#--------更新产品文档函数
updateProductDoc(){

currentDate=`date '+%m-%d %H:%M'`
result=`cd ${cleanProductPath}`
if [ $? -eq 1 ]; then
osascript -e "display notification \"$cleanProductPath\" with title \"产品文档路径错误！已停止更新！at:$currentDate\""
exit
fi
osascript -e "display notification \"$cleanProductPath\" with title \"开始更新产品文档...at:$currentDate\""

cd ${cleanProductPath}
result=`svn update`
isProductUpdateSuccess=$?
if [ $isProductUpdateSuccess -eq 0 ]; then
currentDate=`date '+%m-%d %H:%M'`
osascript -e "display notification \"$result\" with title \"更新产品文档成功！at:$currentDate\""
elif [ $isProductUpdateSuccess -eq 1 ];then
currentDate=`date '+%m-%d %H:%M'`
osascript -e "display notification \"$result\" with title \"更新产品文档失败！at:$currentDate\""
fi

}

#--------打开接口文档函数
openServiceDoc(){
if [ $isServiceUpdateSuccess -eq 0 ];then
open ${cleanServicePath}/apidoc/index.html
fi
}

#--------打开产品文档函数
openProductDoc(){
if [ $isProductUpdateSuccess -eq 0 ];then
open ${cleanProductPath}
fi
}
#-------------------------------------------------------end:定义几个函数-----------------------------------------------------------------

#--------根据参数执行主流程
case $1 in

"o" )
updateServiceDoc
updateProductDoc
openServiceDoc
openProductDoc;;

"os" )
updateServiceDoc
openServiceDoc;;
"s" )
updateServiceDoc;;

"op" )
updateProductDoc
openProductDoc;;
"p" )
updateProductDoc;;

"oo" )
openServiceDoc
openProductDoc;;
"oos" )
openServiceDoc;;
"oop" )
openProductDoc;;

"t" )
echo -n "failed";;

* )
updateServiceDoc
updateProductDoc;;

esac

#--------最后检查，只要一个更新失败，就打开iterm

if [ $isServiceUpdateSuccess -eq 1 ] || [ $isProductUpdateSuccess -eq 1 ];then
    echo -n "failed"
fi