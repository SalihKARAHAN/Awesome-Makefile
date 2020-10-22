CC=gcc

SRCDIR=src

build: $(SRCDIR)/main.c $(SRCDIR)/say_hello.c
	$(CC) $(SRCDIR)/main.c $(SRCDIR)/say_hello.c -o say_hello.o