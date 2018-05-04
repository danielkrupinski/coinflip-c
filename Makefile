CFLAGS=-O$(O) 
O=2
LFLAGS=
OBJS=objs/coinflip.o objs/main.o


.PHONY: all
all: objs a.out

./a.out: $(OBJS)
	@ echo "    LINK ./a.out"
	@ $(CC) $(OBJS) -o "./a.out" $(LFLAGS)

objs/coinflip.o: src/coinflip.c src/../include/coinflip.h
	@ echo "    CC   src/coinflip.c"
	@ $(CC) $(CFLAGS) -c "src/coinflip.c" -o $@
objs/main.o: src/main.c src/../include/coinflip.h
	@ echo "    CC   src/main.c"
	@ $(CC) $(CFLAGS) -c "src/main.c" -o $@

objs:
	@ mkdir "objs"
.PHONY: c clean
c: clean
clean:
	@ if [ -d "objs" ]; then rm -r "objs"; fi
	@ rm -f "./a.out"
	@ echo "    CLEAN"
.PHONY: f fresh
f: fresh
fresh: clean
	@ make all --no-print-directory
.PHONY: r run
r: run
run: all
	@ ././a.out

.PHONY: d debug
d: debug
debug: CFLAGS += -DDEBUG -g3 -Wall -Wextra
debug: O=0
debug: all

.PHONY: check-syntax
check-syntax:
	$(CC) $(CFLAGS) -fsyntax-only -Wall -o /dev/null -S $(CHK_SOURCES)
