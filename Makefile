CFLAGS=
WARN=-Wall -Wextra -Weffc++
O=0
std=c++11
LFLAGS=

CMD=$(CXX) -O$(O) $(WARN) -std=$(std) $(CFLAGS) $^ -o $@ $(LFLAGS)
COLORIZER=


.PHONY: all
all: a.out

a.out: test.cpp
	@ echo $(CMD)
	@ $(CMD) $(COLORIZER)

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

.PHONY: color
color: COLORIZER=2>&1 | perl -ne 'if (-t STDOUT) { if (/error/) { print "[31m" . $$_ . "[0m" } elsif (/warning/) { print "[33m" . $$_ . "[0m" } else { print } } else { print }'
color: all

.PHONY: v valgrind
v: valgrind
valgrind: CFLAGS += -g
valgrind: all
	@ command -v valgrindc > /dev/null 2>&1 && valgrindc ./a.out || valgrind ./a.out

.PHONY: check-syntax
check-syntax:
	g++ $(CXXFLAGS) -fsyntax-only -Wall -o /dev/null -S $(CHK_SOURCES)
