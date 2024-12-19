# Variables
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -pthread
TARGET = csrfrouter
SRC = main.cpp
INSTALL_DIR = /usr/local/bin

# Rules
all: $(TARGET)

$(TARGET): $(SRC) $(HEADERS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SRC)

install: $(TARGET)
	@mkdir -p $(INSTALL_DIR)
	cp $(TARGET) $(INSTALL_DIR)

clean:
	rm -f $(TARGET)

uninstall:
	rm -f $(INSTALL_DIR)/$(TARGET)

.PHONY: all clean install uninstall
