MODULE_NAME := hack
obj-m       := $(MODULE_NAME).o
$(MODULE_NAME)-objs := entry.o

# базовые флаги для GKI
ccflags-y += -fno-stack-protector
ccflags-y += -O2 -DMODULE -D__KERNEL__

# ОТКЛЮЧАЕМ KASАН
ccflags-y += -fno-sanitize=address

all:
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
	rm -f *.o *.ko *.symvers *.order *.mod* .*.cmd
