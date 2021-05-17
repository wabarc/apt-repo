DOCKER ?= $(shell which docker || which podman)
VERSION = $(shell curl -s 'https://api.github.com/repos/wabarc/wayback/tags?per_page=1' | grep '"name":' | sed -E 's/.*"([^"]+)".*/\1/')

.PHONY: build
build:
	$(DOCKER) build -t apt-builder .
	$(DOCKER) run --rm -v ${PWD}:/apt-repo apt-builder \
		/bin/bash -c "gpg --batch --import < priv.asc; /bin/sh /apt-repo/entrypoint.sh"

.PHONY: publish
publish:
	git commit -am "Release $(VERSION)"
	git push origin main
