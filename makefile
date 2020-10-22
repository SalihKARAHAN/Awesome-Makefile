CC       =  gcc
CFLAGS   = -g -Wall -I.
SRCDIR   =  src

DEPENDENCIES=$(SRCDIR)/say_hello.h

build: program

program: $(SRCDIR)/main.c $(SRCDIR)/say_hello.c
	$(CC) $(CFLAGS) $? -o $@.o