# inotifywait-for-Android
## 0x01 编译
```
git clone https://github.com/dstmath/inotifywait-for-Android.git  
cd inotifywait-for-Android
ndk-build

[armeabi] Compile thumb  : inotifywait <= wrap_inotifywait.c
[armeabi] Compile thumb  : inotifywait <= common.c
[armeabi] Compile thumb  : inotifywait <= inotifytools.c
In file included from jni/libinotifytools/inotifytools.c:31:0:
jni/libinotifytools/../regex/regex.h:367:40: warning: declaration does not declare anything
   unsigned long int __REPB_PREFIX(used);
                                        ^
[armeabi] Compile thumb  : inotifywait <= redblack.c
[armeabi] Executable     : inotifywait
[armeabi] Install        : inotifywait => libs/armeabi/inotifywait
[armeabi] Compile thumb  : inotifywatch <= wrap_inotifywatch.c
[armeabi] Compile thumb  : inotifywatch <= common.c
[armeabi] Compile thumb  : inotifywatch <= inotifytools.c
In file included from jni/libinotifytools/inotifytools.c:31:0:
jni/libinotifytools/../regex/regex.h:367:40: warning: declaration does not declare anything
   unsigned long int __REPB_PREFIX(used);
                                        ^
[armeabi] Compile thumb  : inotifywatch <= redblack.c
[armeabi] Executable     : inotifywatch
[armeabi] Install        : inotifywatch => libs/armeabi/inotifywatch
```
## 0x02 push inotifywatch和inofitywait到手机
```
adb push inotifywatch /data/local/tmp/
adb push inotifywait /data/local/tmp/
adb shell
su
mount -o rw,remount /system
cp /data/local/tmp/inotifywatch /system/xbin
chmod 755 /system/xbin/inotivywatch
cp /data/local/tmp/inotifywait /system/xbin
chmod 755 /system/xbin/inotivywait
```
## 0x03 用法
inotifywait主要用来监控文件系统，对文件和目录访问进行记录。  

```
adb shell
#查看帮助  
inotifywait -h
#监控/system目录
inotifywait -r -m --timefmt %a-%b-%d-%T  --format '%e:------%w%f %T' /system
#输出如下
Setting up watches.  Beware: since -r was given, this may take a while!
Watches established.
ACCESS:------/system/priv-app/SystemUI/SystemUI.apk Mon-Aug-29-22:08:32
ACCESS:------/system/framework/framework-res.apk Mon-Aug-29-22:08:34
ACCESS:------/system/framework/framework-res.apk Mon-Aug-29-22:08:34
ACCESS:------/system/framework/framework-res.apk Mon-Aug-29-22:08:34
ACCESS:------/system/framework/framework-res.apk Mon-Aug-29-22:08:34
ACCESS:------/system/framework/framework-res.apk Mon-Aug-29-22:08:34
ACCESS:------/system/framework/framework-res.apk Mon-Aug-29-22:08:34
ACCESS:------/system/framework/org.cyanogenmod.platform-res.apk Mon-Aug-29-22:08:34
OPEN:------/system/lib/hw/gralloc.msm8974.so Mon-Aug-29-22:08:34
CLOSE_NOWRITE,CLOSE:------/system/lib/hw/gralloc.msm8974.so Mon-Aug-29-22:08:34
ACCESS:------/system/framework/framework-res.apk Mon-Aug-29-22:08:34
ACCESS:------/system/framework/framework-res.apk Mon-Aug-29-22:08:34
OPEN:------/system/lib/hw/gralloc.msm8974.so Mon-Aug-29-22:08:35
CLOSE_NOWRITE,CLOSE:------/system/lib/hw/gralloc.msm8974.so Mon-Aug-29-22:08:35
```
更多用法可以用 -h来查看更多的选项。

## 0x04 参考链接
* [https://github.com/rvoicilas/inotify-tools/wiki](https://github.com/rvoicilas/inotify-tools/wiki)
