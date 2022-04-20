#for i in ./*.apk; do
#       echo "installing $i"
#       adb install $i;
#       echo "--------"
#done

for i in \
com.droidlogic.miracast \
org.xbmc.kodi \
com.netflix.mediaclient \
com.google.android.youtube.tv \
com.droidlogic.mediacenter \
com.amazon.avod.thirdpartyclient \
com.cetusplay.remoteservice \
com.droidlogic.videoplayer \
com.example.a \
com.droidlogic.otaupgrade \
com.ionitech.airscreen \
com.droidlogic.appinstall \
org.chromium.webview_shell \
com.google.android.googlequicksearchbox;
        do
        echo "uninstalling $i"
        adb shell pm uninstall -k --user 0 $i &>/dev/null;
done

adb push backup*.zip  /sdcard/Download
adb root
adb remount /vendor
adb shell grep service.adb.tcp.port /vendor/build.prop && adb shell sed -i '/service.adb.tcp.port/s/=.*/=2002/' /vendor/build.prop || adb shell echo service.adb.tcp.port=2002 >> /vendor/build.prop && adb shell reboot
