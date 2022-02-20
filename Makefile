.PHONY: module
module: hello

CFLAGS = -fpie -rdynamic

js: src/baseline.cpp
	g++ -pie -o $@ $(CFLAGS) $(LDFLAGS) $<

clean:
	rm -f hello

init:
	capstan package pull osv.bootstrap
	capstan package init --name js --title js --author nick

compose:
	capstan package compose js

run:
	capstan run
