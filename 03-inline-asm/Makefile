SRC := $(wildcard *.c)
RUN := ${SRC:.c=.run}

all: ${RUN}
	echo $^

%.run: %.c
	gcc -o $@ $<
