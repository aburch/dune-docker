all: base-8-stamp base-9-stamp dune-2.3-stamp dune-2.4-stamp dune-fufem-stamp dune-fufem-latest-stamp dune-latest-stamp

clean:
	rm -f -- ./*-stamp
	rm -f -- base-8/duneci-ctest base-9/duneci-ctest
	rm -f -- base-8/duneci-install-module base-9/duneci-install-module

build-arg =
ifneq ($(ftp_proxy),)
  build-arg += --build-arg="ftp_proxy=$(ftp_proxy)"
endif
ifneq ($(FTP_PROXY),)
  build-arg += --build-arg="FTP_PROXY=$(FTP_PROXY)"
endif
ifneq ($(http_proxy),)
  build-arg += --build-arg="http_proxy=$(http_proxy)"
endif
ifneq ($(HTTP_PROXY),)
  build-arg += --build-arg="HTTP_PROXY=$(HTTP_PROXY)"
endif
ifneq ($(https_proxy),)
  build-arg += --build-arg="https_proxy=$(https_proxy)"
endif
ifneq ($(HTTPS_PROXY),)
  build-arg += --build-arg="HTTPS_PROXY=$(HTTPS_PROXY)"
endif
ifneq ($(no_proxy),)
  build-arg += --build-arg="no_proxy=$(no_proxy)"
endif
ifneq ($(NO_PROXY),)
  build-arg += --build-arg="NO_PROXY=$(NO_PROXY)"
endif

docker-build = docker build $(build-arg)

base-8-stamp: base-8/Dockerfile base-common/duneci-ctest base-common/duneci-install-module
	cp base-common/duneci-ctest base-8/
	cp base-common/duneci-install-module base-8/
	$(docker-build) --no-cache -t duneci/base:8 base-8
	touch $@

base-9-stamp: base-9/Dockerfile base-common/duneci-ctest base-common/duneci-install-module
	cp base-common/duneci-ctest base-9/
	cp base-common/duneci-install-module base-9/
	$(docker-build) --no-cache -t duneci/base:9 base-9
	touch $@

dune-2.3-stamp: base-8-stamp dune-2.3/Dockerfile
	$(docker-build) -t duneci/dune:2.3 dune-2.3
	touch $@

dune-2.4-stamp: base-9-stamp dune-2.4/Dockerfile
	$(docker-build) -t duneci/dune:2.4 dune-2.4
	touch $@

dune-fufem-stamp: dune-fufem/Dockerfile dune-2.4-stamp
	$(docker-build) --no-cache -t duneci/dune-fufem:2.4 dune-fufem
	touch $@

dune-fufem-git-stamp: dune-fufem-git/Dockerfile dune-git-stamp
	$(docker-build) --no-cache -t duneci/dune-fufem:git dune-fufem-git
	touch $@

dune-git-stamp: base-9-stamp dune-git/Dockerfile
	$(docker-build) --no-cache -t duneci/dune:git-staging dune-git
	#docker run -i duneci/dune:git-staging sh -c "dunecontrol make build_tests && dunecontrol make test"
	docker tag -f duneci/dune:git-staging duneci/dune:git
	touch $@

dune-latest-stamp: dune-2.4-stamp
	docker tag -f duneci/dune:2.4 duneci/dune:latest
	touch $@

dune-fufem-latest-stamp: dune-fufem-stamp
	docker tag -f duneci/dune-fufem:2.4 duneci/dune-fufem:latest
	touch $@
