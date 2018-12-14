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
git push origin --delete tag "1.4.4.0"
v=$(pod spec lint DaizqPod.podspec)
if [[ $v =~ "ERROR" ]]; then
	echo "fail"
else
	echo "succuss"
fi
