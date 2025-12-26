MODULE_NAME := hack
obj-m       := $(MODULE_NAME).o
$(MODULE_NAME)-objs := entry.o

# базовые флаги
ccflags-y += -fno-stack-protector
ccflags-y += -O2 -DMODULE -D__KERNEL__

# ОТКЛЮЧАЕМ KASAN (правильный синтаксис)
ccflags-y += -fno-sanitize=address
ccflags-y += -DNO_SANITIZE_ADDRESS

# сборка
all:
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
	rm -f *.o *.ko *.symvers *.order *.mod* .*.cmd

