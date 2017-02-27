#!/bin/bash
# projAbbr='iOS_Bash_Build_Demo'

function autoBuild()
{
# prepareBuildEnv
# updatePodsDeps
clearProjs
buildProjs
signProjs
# uploadAppFile
echo ${projAbbr} '- ALL Action Completed!'
}

# function prepareBuildEnv()
# {
# 	# TODO - 执行编译器准备工作, 可以调整项目配置等执行任务
# 	# eg: mkdir xxx
# }

# function updatePodsDeps()
# {
# 	# TODO - 更新Pod依赖
# 	# eg: pod install
# }

function clearProjs()
{
# TODO - clean项目
# eg: xcodebuild -workspace "demo.xcworkspace"  -scheme "targetName"  -configuration 'Release Adhoc' clean
xcodebuild -list
xcodebuild -target "USchoolTeacher" -scheme "USchoolTeacher" -configuration 'Release' clean
}

function buildProjs()
{
# TODO - 编译项目, 生产带证书签名的App文件
# eg: xcodebuild -workspace "demo.xcworkspace" -sdk iphoneos -scheme "targetName" -configuration 'Release Adhoc' SYMROOT='$(PWD)'
# eg: xcodebuild -workspace "demo.xcworkspace" -sdk iphoneos -scheme "targetName" -configuration 'Release Adhoc' CODE_SIGN_IDENTITY="keychain中证书代号名称" SYMROOT='$(PWD)'
xcodebuild -sdk iphoneos -target "USchoolTeacher" -scheme "USchoolTeacher" -configuration 'Release' CODE_SIGN_IDENTITY="iPhone Developer" SYMROOT='$(PWD)'
}

function signProjs()
{
# TODO - 填充签名脚本, 用于签名编译到的App, 打包成ipa文件
# eg: xcrun -sdk iphoneos PackageApplication -v "demo.app" -o "demo.ipa" > $logPath
xcrun -sdk iphoneos PackageApplication -v ./Release-iphoneos/USchoolTeacher.app -o /Users/songyongjian/Desktop/USchoolTeacher.ipa
}

function uploadAppFile()
{
# TODO - 上传App文件到发布平台
# 蒲公英、Fir.im都是不错的选择哦
fir login 25242cc188c5e833783d4a0f95044fc8
fir publish /Users/songyongjian/Desktop/USchoolTeacher.ipa
}

# # 如果使用第三方平台, 一般不需要createPlist, 因为第三方平台都已经集成
# function createPlist()
# {
# 	# TODO - 创建Plist文件, 用于企业证书下载
# }

autoBuild
