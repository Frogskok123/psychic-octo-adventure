# hack.mk  --  4.19.312-perf+, clang-17, lld
MODULE_NAME := hack
obj-m       := $(MODULE_NAME).o
$(MODULE_NAME)-objs := entry.o

# флаги для 4.19 + clang
ccflags-y += -fno-stack-protector
ccflags-y += -O2 -DMODULE -D__KERNEL__

# сборка
all:
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=arm64 CC=clang LD=ld.lld modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
	rm -f *.o *.ko *.symvers *.order *.mod* .*.cmd

help:
	@echo "make KDIR=/path/to/4.19.312 all   -- build"
	@echo "make KDIR=/path/to/4.19.312 clean -- clean"

