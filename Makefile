GCC=gcc

files=$(wildcard src/**/*.c)

srcs=$(files)

obj=$(srcs:src/%.c=objs/%.o)

$(obj):$(srcs)
	mkdir -p $@.temp
	rm -fdr $@.temp
	$(GCC) -c  $< -o  $@

objs/main.o: 
	$(GCC) -c src/main.c -o objs/main.o

build: objs/main.o $(obj)
	$(GCC) objs/main.o $(obj) -o bin/main

