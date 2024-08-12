CC = g++

CFLAGS = -std=c++14 -O2
LDFLAGS = -lglfw
DBG = -g

GLAD_SRC ?= ./glad.c
SRC ?=

BIN = ./bin

all: $(SRC)
	$(CC) $(GLAD_SRC) $(SRC) -o $(BIN)/main $(CFLAGS) $(LDFLAGS) && $(BIN)/main

debug: $(SRC)
	$(CC) $(GLAD_SRC) $(SRC) -o $(BIN)/main $(CFLAGS) $(LDFLAGS) $(DBG)
