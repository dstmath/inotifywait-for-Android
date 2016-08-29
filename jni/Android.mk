LOCAL_PATH := $(call my-dir)

### inotify
include $(CLEAR_VARS)

# build PIE (for Android 4.1.2 - 4.4 / 5.0 or later)
LOCAL_CFLAGS += -fPIE -std=c99
LOCAL_LDFLAGS += -fPIE -pie

# build non-PIE (for Android 4.0.3 or earlier)
#LOCAL_CFLAGS   = -std=c99

LOCAL_C_INCLUDES := \
	./jni/regex \
	./jni/libinotifytools

LOCAL_MODULE    := inotifywait
LOCAL_SRC_FILES := wrap_inotifywait.c common.c libinotifytools/inotifytools.c libinotifytools/redblack.c

include $(BUILD_EXECUTABLE)

#### inotifywatch
include $(CLEAR_VARS)

# build PIE (for Android 4.1.2 - 4.4 / 5.0 or later)
LOCAL_CFLAGS += -fPIE -std=c99
LOCAL_LDFLAGS += -fPIE -pie

# build non-PIE (for Android 4.0.3 or earlier)
#LOCAL_CFLAGS   = -std=c99

LOCAL_C_INCLUDES := \
	./jni/regex \
	./jni/libinotifytools

LOCAL_MODULE    := inotifywatch
LOCAL_SRC_FILES := wrap_inotifywatch.c common.c libinotifytools/inotifytools.c libinotifytools/redblack.c

include $(BUILD_EXECUTABLE)
