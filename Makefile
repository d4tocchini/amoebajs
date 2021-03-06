CXX=em++
CXXFLAGS=-std=c++11 --bind -Iamoeba -DAM_API='extern __attribute__((used))' -DAM_IMPLEMENTATION -s RESERVED_FUNCTION_POINTERS=1

all: dist/amoebajs_node.js

dist/amoebajs_node.js: dist/amoebajs_web.js

dist/amoebajs_web.js: lib/amoebalib.bc lib/index.js
	npm run flow
	webpack

lib/amoebalib.bc: lib/amoebalib.cpp amoeba/amoeba.h
	${CXX} ${CXXFLAGS} lib/amoebalib.cpp -o lib/amoebalib.bc

clean:
	rm lib/amoebalib.bc dist/amoebajs_node.js dist/amoebajs_web.js

.PHONY: all clean
