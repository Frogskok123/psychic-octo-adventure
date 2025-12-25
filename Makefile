MODULE_NAME := hack
obj-m := $(MODULE_NAME).o
$(MODULE_NAME)-objs := entry.o

all:
	make -C kernel M=$(PWD) ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules

clean:
	make -C kernel M=$(PWD) clean
	rm -f *.o *.ko *.symvers *.order *.mod*
