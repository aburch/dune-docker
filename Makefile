all: base-8-stamp base-9-stamp dune-2.3-stamp dune-2.4-stamp dune-fufem-stamp dune-fufem-latest-stamp dune-latest-stamp

clean:
	rm -f -- ./*-stamp

base-8-stamp: base-8/Dockerfile
	docker build --no-cache -t duneci/base:8 base-8
	touch $@

base-9-stamp: base-9/Dockerfile
	docker build --no-cache -t duneci/base:9 base-9
	touch $@

dune-2.3-stamp: base-8-stamp dune-2.3/Dockerfile
	docker build -t duneci/dune:2.3 dune-2.3
	touch $@

dune-2.4-stamp: base-9-stamp dune-2.4/Dockerfile
	docker build -t duneci/dune:2.4 dune-2.4
	touch $@

dune-fufem-stamp: dune-fufem/Dockerfile dune-2.4-stamp
	docker build --no-cache -t duneci/dune-fufem:2.4 dune-fufem
	touch $@

dune-git-stamp: base-9-stamp dune-git/Dockerfile
	docker build --no-cache -t duneci/dune:git-staging dune-git
	#docker run -i duneci/dune:git-staging sh -c "dunecontrol make build_tests && dunecontrol make test"
	docker tag -f duneci/dune:git-staging duneci/dune:git
	touch $@

dune-latest-stamp: dune-2.4-stamp
	docker tag -f duneci/dune:2.4 duneci/dune:latest
	touch $@

dune-fufem-latest-stamp: dune-fufem-stamp
	docker tag -f duneci/dune-fufem:2.4 duneci/dune-fufem:latest
	touch $@
