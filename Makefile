.PHONY: module
module: hello

CFLAGS = -fpie -rdynamic

CAPSTAN=bin/capstan


$(CAPSTAN):
	mkdir -p bin
	wget -O $(CAPSTAN) https://github.com/cloudius-systems/capstan/releases/download/v0.5.0/capstan	
	chmod +x $(CAPSTAN)

js: src/baseline.cpp
	g++ -pie -o $@ $(CFLAGS) $(LDFLAGS) $<

clean:
	rm -f hello

init:
	$(CAPSTAN) package pull osv.bootstrap
	$(CAPSTAN) package init --name js --title js --author nick

compose:
	$(CAPSTAN) package compose js

run:
	$(CAPSTAN) run
