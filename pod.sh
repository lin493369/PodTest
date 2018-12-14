# if [[ $POD_PUSH != true ]] || [[ $SDK_VERSION != '' ]]; then
# 	exit
# fi
# cp SdkLib/GTCountSDK.h cocoapods/
# cp SdkLib/libGTCommonSDK.a cocoapods/
# cp SdkLib/libGTCountSDK.a cocoapods/
# GeshuVersion=$(grep s.version cocoapods/GCSDK.podspec | sed -n "1p" | sed 's/.*\([0-9].[0-9].[0-9].[0-9]\).*/\1/g')
# sedStr='s/'$GeshuVersion'/'$GeshuVersion'/g'
# LC_CTYPE=C sed  -i '' $sedStr cocoapods/GCSDK.podspec
# cd cocoapods
# git add .
# git commit -m "update: 更新至$GeshuVersion"
# git push
# git tag -a $GeshuVersion -m "$GeshuVersion"
# git push origin --tags
# SDK_VERSION=$(grep GC_SDK_VSERSION  GCSDK/GTCountSDK/GTCountSDK/Main/Const/GCConst.h | sed -n "1p" | sed 's/.*\([0-9].[0-9].[0-9].[0-9]\).*/\1/g')
# echo $SDK_VERSION
# exit;
SDK_VERSION="1.4.2.0"
git tag -d $SDK_VERSION
git push origin :refs/tags/$SDK_VERSION
git tag -a $SDK_VERSION -m "$SDK_VERSION"
git push origin --tags

isValid=$(pod spec lint DaizqPod.podspec)
echo $isValid
if [[ $isValid =~ "ERROR" ]]; then
	echo "pod valid fail";
	exit;
else
	podPushMsg=$(pod trunk push)
	echo $podPushMsg
	if [[ $podPushMsg =~ "successfully published" ]]; then
		echo "pod successfully published"
		echo run=true >var.txt
	else
		echo "pod published fail"
	fi
fi
