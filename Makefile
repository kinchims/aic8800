# Variables
BUILD_DIR = src/SDIO/driver_fw/driver/aic8800
TARGET = aic8800_fdrv.ko

# Default target to build the driver
all: build

# Build the driver
build:
	@echo "Compiling the driver..."
	cd $(BUILD_DIR) && make

# Install the driver using the install script
install: build
	@echo "Installing the driver using install_setup.sh..."
	cd $(BUILD_DIR) && make install
	@bash $(INSTALL_SCRIPT)

# Uninstall the driver using the uninstall script
uninstall:
	@echo "Uninstalling the driver using uninstall_setup.sh..."
	cd $(BUILD_DIR) && make uninstall
	@bash $(UNINSTALL_SCRIPT)

# Clean the build artifacts
clean:
	@echo "Cleaning the build artifacts..."
	cd $(BUILD_DIR) && make clean
	$(MAKE) -C $(BUILD_DIR) clean

# Phony targets to avoid conflicts with files
.PHONY: all build install uninstall clean