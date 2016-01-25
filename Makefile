all: dune-2.3-stamp dune-2.4-stamp dune-fufem-stamp dune-latest-stamp

clean:
	rm -f -- ./*-stamp

dune-2.3-stamp: dune-2.3/Dockerfile
	docker build -t dune:2.3 dune-2.3
	touch $@

dune-2.4-stamp: dune-2.4/Dockerfile
	docker build -t dune:2.4 dune-2.4
	touch $@

dune-fufem-stamp: dune-fufem/Dockerfile dune-2.4-stamp
	docker build -t dune-fufem dune-fufem
	touch $@

dune-latest-stamp: dune-2.4-stamp
	docker tag -f dune:2.4 dune:latest
	touch $@
