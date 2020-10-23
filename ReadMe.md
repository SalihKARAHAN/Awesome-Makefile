# makefile tutorial

This repository includes a makefile, the makefile is adaptable to any C or CPP project as easily. 
The makefile generates an output for each source file, so when you change any source file, the GCC will recompile just which file that is changed and update the output.

### Makefile magics:

step: dependencies_file dependencies_steps

| macro | explanation |
|-|-|
| $@ | step's definition name |
| $? | step's all dependencies |
| $< | step's just file dependencies | 

### makefile

    CC       =  gcc
    CFLAGS   =  -g -Wall -I.
    SRCDIR   =  src
    OBJDIR   =  obj
    BINDIR   =  bin

    SOURCES  = $(shell find $(SRCDIR) -type f -name '*.c') # main.c say_hello.c
    OBJECTS  = $(patsubst $(SRCDIR)/%,$(OBJDIR)/%,$(SOURCES:.c=.o)) # main.o say_hello.o
    DEPS     = $(OBJECTS:.o=.d)
    BINARY   = $(BINDIR)/Program.bin
    #-include $(DEPS)

    all: buildsolution

    buildsolution: dir $(BINARY)

    dir:
        mkdir -p $(OBJDIR)
        mkdir -p $(BINDIR)

    $(BINARY): $(OBJECTS)
        $(CC) $(CFLAGS) $^ -o $@

    $(OBJDIR)/%.o: $(SRCDIR)/%.c
        $(CC) $(CFLAGS) -c -MMD -MP -o $@ $<

    clean:
        echo "clean runing..."


