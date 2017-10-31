OLD_IFS="$IFS"
IFS="."
a=($1)
IFS="$OLD_IFS"


cd /Users/xuyanping/prd/00Product_release


client=${a[0]}
version="${a[1]}"".""${a[2]}"
suffix="${a[1]}"".""${a[2]}"
length=${#a[@]}
four=4
pathPre="v""${version}""文档"
if [ $length -eq $four ]
    then
        suffix="${a[1]}"".""${a[2]}"".""${a[3]}"
		pathPre="v""${version}""文档""/V""${suffix}""文档"
fi

case "$client" in
  "s")
	svn update ${pathPre}/02demo与交互文档/学生端V${suffix}
	open ${pathPre}/02demo与交互文档/学生端V${suffix}/start.html
    ;;

  "t")
    svn update ${pathPre}/02demo与交互文档/教师端V${suffix}
    open ${pathPre}/02demo与交互文档/教师端V${suffix}/start.html
    ;;

  "a")
    svn update ${pathPre}/02demo与交互文档/后台V${suffix}
    open ${pathPre}/02demo与交互文档/后台V${suffix}/start.html
	;;
  "debug" )
		cd /Users/xuyanping/mycode/gitlab/yangjianhui/hqyxjy/ci/clientapi/apidoc
		php apilist.php ../apitest/apilist.json
		open -a Safari /Users/xuyanping/mycode/gitlab/yangjianhui/hqyxjy/ci/clientapi/apitest/index.html
		;;
	"db" )
		cd /Users/xuyanping/mycode/gitlab/yangjianhui/hqyxjy/doc/database
		php rebuild.php
		open -a Safari /Users/xuyanping/mycode/gitlab/yangjianhui/hqyxjy/doc/database/hqyxjy.html
		;;
	"api" )
		cd /Users/xuyanping/mycode/gitlab/yangjianhui/hqyxjy/ci/clientapi/apidoc
		./local_build.sh
		open -a Safari /Users/xuyanping/mycode/mydoc/clientapi/index.html
		;;
	"rule" )
		open /Users/xuyanping/prd/00Product_release/v1.5文档/V1.5.0文档/01需求文档/消息推送与属性业务规则.xlsx
esac