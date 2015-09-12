# 
# All compopnents required to build aapt
#

LOCAL_PATH:= $(call my-dir)
LP:=$(LOCAL_PATH)

#--- Build expat
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
src/expat/lib/xmlparse.c \
src/expat/lib/xmlrole.c \
src/expat/lib/xmltok.c
LOCAL_C_INCLUDES := $(LP)/src/expat
LOCAL_CFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes -fexceptions -DHAVE_EXPAT_CONFIG_H
LOCAL_MODULE:= libexpat
include $(BUILD_STATIC_LIBRARY)

#--- Build zlib
include $(CLEAR_VARS)
zlib_files := \
src/zlib/adler32.c \
src/zlib/compress.c \
src/zlib/crc32.c \
src/zlib/gzio.c \
src/zlib/uncompr.c \
src/zlib/deflate.c \
src/zlib/trees.c \
src/zlib/zutil.c \
src/zlib/inflate.c \
src/zlib/infback.c \
src/zlib/inftrees.c \
src/zlib/inffast.c
LOCAL_ARM_MODE := arm
LOCAL_MODULE := libz
LOCAL_CFLAGS += -O3 -DUSE_MMAP
LOCAL_SRC_FILES := $(zlib_files)
include $(BUILD_STATIC_LIBRARY)

#--- Build libpng
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
src/libpng/png.c \
src/libpng/pngerror.c \
src/libpng/pnggccrd.c \
src/libpng/pngget.c \
src/libpng/pngmem.c \
src/libpng/pngpread.c \
src/libpng/pngread.c \
src/libpng/pngrio.c \
src/libpng/pngrtran.c \
src/libpng/pngrutil.c \
src/libpng/pngset.c \
src/libpng/pngtrans.c \
src/libpng/pngvcrd.c \
src/libpng/pngwio.c \
src/libpng/pngwrite.c \
src/libpng/pngwtran.c \
src/libpng/pngwutil.c

LOCAL_STATIC_LIBRARIES += libz
#LOCAL_LDLIBS += -lz

LOCAL_CFLAGS := -fomit-frame-pointer
LOCAL_MODULE:= libpng

include $(BUILD_STATIC_LIBRARY)

#--- Build cutils
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
src/cutils/array.c \
src/cutils/hashmap.c \
src/cutils/atomic.c \
src/cutils/native_handle.c \
src/cutils/buffer.c \
src/cutils/socket_inaddr_any_server.c \
src/cutils/socket_local_client.c \
src/cutils/socket_local_server.c \
src/cutils/socket_loopback_client.c \
src/cutils/socket_loopback_server.c \
src/cutils/socket_network_client.c \
src/cutils/config_utils.c \
src/cutils/cpu_info.c \
src/cutils/load_file.c \
src/cutils/strdup16to8.c \
src/cutils/strdup8to16.c \
src/cutils/record_stream.c \
src/cutils/process_name.c \
src/cutils/properties.c \
src/cutils/threads.c \
src/cutils/sched_policy.c \
src/cutils/abort_socket.c \
src/cutils/selector.c \
src/cutils/tztime.c \
src/cutils/adb_networking.c \
src/cutils/zygote.c \
src/cutils/ashmem-dev.c \
src/cutils/atomic-android-arm.S \
src/cutils/memset32.S
#src/cutils/mspace.c \
#src/cutils/mq.c \

LOCAL_C_INCLUDES := $(LP)/include
LOCAL_CFLAGS := -DHAVE_PTHREADS
LOCAL_MODULE:= libcutils

include $(BUILD_STATIC_LIBRARY)

#--- Build utils
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
src/utils/Asset.cpp \
src/utils/AssetDir.cpp \
src/utils/AssetManager.cpp \
src/utils/BackupData.cpp \
src/utils/BackupHelpers.cpp \
src/utils/BufferedTextOutput.cpp \
src/utils/CallStack.cpp \
src/utils/Debug.cpp \
src/utils/FileMap.cpp \
src/utils/misc.cpp \
src/utils/RefBase.cpp \
src/utils/ResourceTypes.cpp \
src/utils/SharedBuffer.cpp \
src/utils/Static.cpp \
src/utils/StopWatch.cpp \
src/utils/String8.cpp \
src/utils/String16.cpp \
src/utils/StringArray.cpp \
src/utils/SystemClock.cpp \
src/utils/TextOutput.cpp \
src/utils/Threads.cpp \
src/utils/Timers.cpp \
src/utils/Unicode.cpp \
src/utils/ZipFileCRO.cpp \
src/utils/ZipFileRO.cpp \
src/utils/ZipUtils.cpp \
src/utils/VectorImpl.cpp

LOCAL_STATIC_LIBRARIES += libcutils
LOCAL_STATIC_LIBRARIES += libz

LOCAL_LDLIBS += -llog

LOCAL_C_INCLUDES := $(LP)/include
LOCAL_CFLAGS := -D__arm__ -DHAVE_POSIX_FILEMAP -DHAVE_SYS_UIO_H -DHAVE_PTHREADS
LOCAL_MODULE:= libutils
include $(BUILD_SHARED_LIBRARY)


#--- Build libhost
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
src/host/CopyFile.c \
src/host/pseudolocalize.cpp

LOCAL_C_INCLUDES := $(LP)/include
LOCAL_MODULE:= libhost
include $(BUILD_STATIC_LIBRARY)


# ---- Build aapt
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
src/aapt/Images.cpp \
src/aapt/AaptAssets.cpp \
src/aapt/SourcePos.cpp \
src/aapt/XMLNode.cpp \
src/aapt/ResourceTable.cpp \
src/aapt/ZipEntry.cpp \
src/aapt/ZipFile.cpp \
src/aapt/StringPool.cpp \
src/aapt/Resource.cpp \
src/aapt/Main.cpp \
src/aapt/Command.cpp \
src/aapt/Package.cpp

#LOCAL_SHARED_LIBRARIES := libpng
LOCAL_SHARED_LIBRARIES += libutils

LOCAL_STATIC_LIBRARIES := libexpat
LOCAL_STATIC_LIBRARIES += libhost
LOCAL_STATIC_LIBRARIES += libz
LOCAL_STATIC_LIBRARIES += libpng

#LOCAL_STATIC_LIBRARIES += libcutils
#LOCAL_STATIC_LIBRARIES += libutils
#LOCAL_STATIC_LIBRARIES += libhost

LOCAL_C_INCLUDES := $(LP)/include
LOCAL_C_INCLUDES += $(LP)/src/expat/lib
LOCAL_C_INCLUDES += $(LP)/src/libpng

LOCAL_LDLIBS += -llog

LOCAL_MODULE := aapt

include $(BUILD_EXECUTABLE)


