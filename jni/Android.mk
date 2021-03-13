LOCAL_PATH := $(call my-dir)

# libhelloworldservice shared library

include $(CLEAR_VARS)

LOCAL_MODULE := mylibhelloworldservice

LOCAL_SRC_FILES := \
	IHelloWorldService.cpp

LOCAL_SHARED_LIBRARIES := \
	libbinder \
	libutils

include $(BUILD_SHARED_LIBRARY)


# helloworldservice executable

include $(CLEAR_VARS)

LOCAL_MODULE := helloworldservice

LOCAL_SRC_FILES := \
	HelloWorldService.cpp

LOCAL_SHARED_LIBRARIES := \
	libbinder \
	libutils \
	mylibhelloworldservice

include $(BUILD_EXECUTABLE)

# helloworldclient executable

include $(CLEAR_VARS)

LOCAL_MODULE := helloworldclient

LOCAL_SRC_FILES := \
	HelloWorldClient.cpp

LOCAL_SHARED_LIBRARIES := \
	libbinder \
	libutils \
	mylibhelloworldservice

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE := libbinder
LOCAL_SRC_FILES := $(TARGET_ARCH_ABI)/libbinder.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include/binder
LOCAL_CPPFLAGS    := -Werror -std=c++11 -fno-rtti -fno-exceptions -Wall
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libutils
LOCAL_SRC_FILES := $(TARGET_ARCH_ABI)/libutils.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include/utils $(LOCAL_PATH)/include/system
LOCAL_SHARED_LIBRARIES := libcutils
LOCAL_CPPFLAGS    := -Werror -std=c++11 -fno-rtti -fno-exceptions -Wall
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libcutils
LOCAL_SRC_FILES := $(TARGET_ARCH_ABI)/libcutils.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include/cutils
LOCAL_CPPFLAGS    := -Werror -std=c++11 -fno-rtti -fno-exceptions -Wall
LOCAL_EXPORT_LDLIBS := -llog
include $(PREBUILT_SHARED_LIBRARY)

# include $(CLEAR_VARS)
# LOCAL_MODULE := libgraphic
# LOCAL_SRC_FILES := $(TARGET_ARCH_ABI)/libgraphic.so
# LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include/cutils
# LOCAL_CPPFLAGS    := -Werror -std=c++11 -fno-rtti -fno-exceptions -Wall
# LOCAL_EXPORT_LDLIBS := -llog
# include $(PREBUILT_SHARED_LIBRARY)