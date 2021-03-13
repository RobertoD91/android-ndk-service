Android NDK Service
===================

Per build: `ndk-build` nella root

Varibili d'ambiente usate:
```
# ANDROID SDK
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"
export ANDROID_SDK_ROOT="/Users/Roberto/Library/Android/sdk"
export PATH="/Users/Roberto/Library/Android/sdk/platform-tools":$PATH
export PATH="/Users/Roberto/Library/Android/sdk/build-tools/30.0.3/":$PATH
# ANDROID NDK
#export NDK_APPLICATION_MK=./Application.mk
#export APP_BUILD_SCRIPT=./Android.mk
#export NDK_PROJECT_PATH=.
export PATH="/Users/Roberto/Library/Android/sdk/ndk/22.0.7026061/:$PATH" # DEVI CAMBIARE ad ogni update
```

per selezionare l'architettura:
`APP_ABI := armeabi-v7a arm64-v8a x86`

per prendere le libreria da un device:
```
adb shell uname -m # per sapere l'architettura del telefono
adb pull /system/lib/libutils.so
adb pull /system/lib/libcutils.so
adb pull /system/lib/libbinder.so
file libbinder.so # vedere se è 32 o 64 bit e mettere poi in jni/armv8l o armeabi-v7a
# copiare con adb push sul telefono
# spesso /sdcard è montato come non eseguibile, copiare altrove 
chmod +x helloworldclient
chmod +x helloworldservice
export LD_LIBRARY_PATH=.
./helloworldservice
# in altro terminale di adb
./helloworldclient
```
