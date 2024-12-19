# Variables
CROSS_COMPILE = arm-linux-gnueabihf-
CXX = $(CROSS_COMPILE)g++
CXXFLAGS = -std=c++17 -Wall -Wextra -pthread
TARGET = testhello
SRC = testhello.cpp
INSTALL_DIR = /usr/local/bin
BUILD_DIR = build

# Rules
all: $(BUILD_DIR) $(TARGET)

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) -o $(BUILD_DIR)/$(TARGET) $(SRC)

install: $(TARGET)
	@mkdir -p $(INSTALL_DIR)
	cp $(BUILD_DIR)/$(TARGET) $(INSTALL_DIR)

clean:
	rm -rf $(BUILD_DIR)

uninstall:
	rm -f $(INSTALL_DIR)/$(TARGET)

.PHONY: all clean install uninstall
