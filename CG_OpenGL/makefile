CC = g++

CFLAGS = -std=c++17 -O2
LDFLAGS = -lglfw -I/usr/local/include/libstb -lassimp
DBG = -g

GLAD_SRC ?= $(abspath ./glad.c)
SRC ?=

BIN = $(abspath ./bin)

all: $(SRC)
	cd $(dir $(SRC)) && $(CC) $(GLAD_SRC) $(abspath $(SRC)) -o $(BIN)/main $(CFLAGS) $(LDFLAGS) && $(BIN)/main

debug: $(SRC)
	cd $(dir $(SRC)) && $(CC) $(GLAD_SRC) $(abspath $(SRC)) -o $(BIN)/main $(CFLAGS) $(LDFLAGS) $(DBG)
