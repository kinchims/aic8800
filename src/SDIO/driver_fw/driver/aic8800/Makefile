# Top-level Makefile for AIC8800 Wi-Fi kernel modules

CONFIG_AIC8800_BTLPM_SUPPORT := m
CONFIG_AIC8800_WLAN_SUPPORT := m
CONFIG_AIC_WLAN_SUPPORT := m

# Submodules
obj-$(CONFIG_AIC8800_BTLPM_SUPPORT) += aic8800_btlpm/
obj-$(CONFIG_AIC8800_WLAN_SUPPORT) += aic8800_fdrv/
obj-$(CONFIG_AIC_WLAN_SUPPORT) += aic8800_bsp/

# Optional flags for compilation
ccflags-y += -DANDROID_PLATFORM

# Build all modules
all: modules

modules:
	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) ARCH=$(ARCH) CROSS_COMPILE=$(TARGET_PREFIX) modules

install:
	mkdir -p $(MODDESTDIR)
	install -p -m 644 aic8800_bsp/aic8800_bsp.ko  $(MODDESTDIR)/
	install -p -m 644 aic8800_fdrv/aic8800_fdrv.ko  $(MODDESTDIR)/
	install -p -m 644 aic8800_btlpm/aic8800_btlpm.ko  $(MODDESTDIR)/
	/sbin/depmod -a ${KVER}

# Clean all submodules
clean:
	$(MAKE) -C aic8800_bsp clean
	$(MAKE) -C aic8800_fdrv clean
	$(MAKE) -C aic8800_btlpm clean
	rm -rf modules.order Module.symvers .tmp_versions