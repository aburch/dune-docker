all: base-8-stamp base-9-stamp dune-2.3-stamp dune-2.4-stamp dune-fufem-stamp dune-latest-stamp

clean:
	rm -f -- ./*-stamp

base-8-stamp: base-8/Dockerfile
	docker build -t duneci/base:8 base-8
	touch $@

base-9-stamp: base-9/Dockerfile
	docker build -t duneci/base:9 base-9
	touch $@

dune-2.3-stamp: base-8-stamp dune-2.3/Dockerfile
	docker build -t duneci/dune:2.3 dune-2.3
	touch $@

dune-2.4-stamp: base-9-stamp dune-2.4/Dockerfile
	docker build -t duneci/dune:2.4 dune-2.4
	touch $@

dune-fufem-stamp: dune-fufem/Dockerfile dune-2.4-stamp
	docker build -t duneci/dune-fufem:2.4 dune-fufem
	touch $@

dune-latest-stamp: dune-2.4-stamp
	docker tag -f duneci/dune:2.4 duneci/dune:latest
	touch $@
