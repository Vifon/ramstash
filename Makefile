CFLAGS=
WARN=-Wall -Wextra -Weffc++
O=0
std=c++0x
LFLAGS=


.PHONY: all
all: a.out

a.out: test.cpp
	$(CXX) -O$(O) $(WARN) -std=$(std) $(CFLAGS) $^ -o $@ $(LFLAGS)

.PHONY: c clean
c: clean
clean:
	@ rm -f "./a.out"
	@ echo "    CLEAN"
.PHONY: f fresh
f: fresh
fresh: clean
	@ make all --no-print-directory
.PHONY: r run
r: run
run: all
	@ ./a.out

.PHONY: d debug
d: debug
debug: CFLAGS += -DDEBUG -g
debug: O=0
debug: CC=gcc
debug: CXX=g++
debug: all

.PHONY: v valgrind
v: valgrind
valgrind: CFLAGS += -g
valgrind: all
	@ valgrindc ./a.out

.PHONY: check-syntax
check-syntax:
	g++ $(CXXFLAGS) -fsyntax-only -Wall -o /dev/null -S $(CHK_SOURCES)
