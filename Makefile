# hack.mk  --  полный Makefile для сборки hack.ko
# под ядро 5.10.136-android12 (AOSP common android12-5.10)

# имя модуля
MODULE_NAME := hack

# объекты
$(MODULE_NAME)-objs := entry.o

# сборка модуля
obj-m := $(MODULE_NAME).o

# флаги компиляции
ccflags-y += -fno-stack-protector
ccflags-y += -fno-pie
ccflags-y += -Wno-unused-result
ccflags-y += -O2
ccflags-y += -DMODULE -D__KERNEL__
ccflags-y += -DNO_VERSION_HASH          # отключаем modversions

# цели
all:
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
	rm -f *.o *.ko *.symvers *.order *.mod* .*.cmd

help:
	@echo "usage:"
	@echo "  make KDIR=/path/to/kernel all   -- build module"
	@echo "  make KDIR=/path/to/kernel clean -- clean"

