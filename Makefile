# Variables
BUILD_DIR = src/SDIO/driver_fw/driver/aic8800
TARGET = aic8800_fdrv.ko

export QUILT_PATCHES = ../../../debian/patches



# Default target to build the driver
all: apply-patches build

apply-patches:
	quilt pop -a -f || true
	quilt push -a

# Build the driver
build:
	@echo "Compiling the driver..."
	cd $(BUILD_DIR) && make


modules_install: build
	cd $(BUILD_DIR) && make modules_install

uninstall:
	cd $(BUILD_DIR) && make uninstall

clean:
	@echo "Cleaning the build artifacts..."
	cd $(BUILD_DIR) && make clean
	$(MAKE) -C $(BUILD_DIR) clean

# Phony targets to avoid conflicts with files
.PHONY: all build install uninstall clean