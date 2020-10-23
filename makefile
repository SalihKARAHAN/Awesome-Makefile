CC       =  gcc
CFLAGS   =  -g -Wall -I.
SRCDIR   =  src
OBJDIR   =  obj
BINDIR   =  bin

SOURCES  = $(shell find $(SRCDIR) -type f -name '*.c') # main.c say_hello.c
OBJECTS  = $(patsubst $(SRCDIR)/%,$(OBJDIR)/%,$(SOURCES:.c=.o)) # main.o say_hello.o
DEPS     = $(OBJECTS:.o=.d)
BINARY   = $(BINDIR)/Program.bin
-include $(DEP)

all: buildsolution

buildsolution: dir $(BINARY)

dir:
	mkdir -p $(OBJDIR)
	mkdir -p $(BINDIR)

$(BINARY): $(OBJECTS)
	$(CC) $(CFLAGS) $^ -lc -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	echo "clean runing..."