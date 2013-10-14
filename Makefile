
BIN = sphia
PREFIX = /usr/local
SOPHIA_SRC = $(wildcard src/sophia/db/*.c)
SRC = $(SOPHIA_SRC) $(wildcard deps/*.c) $(wildcard src/*.c)
CFLAGS = -std=c99 -Isrc/sophia/db -Wall -march=native -fPIC -fvisibility=hidden  -O2

all: clean test build

clean:
	rm -f ./sphia

test:
	@:

build:
	$(CC) $(SRC) $(CFLAGS) -o $(BIN)

install: build
	install $(BIN) $(PREFIX)/bin
	$(MAKE) clean

uninstall:
	rm -f $(PREFIX)/bin/$(BIN)

.PHONY: all clean test build install uninstall