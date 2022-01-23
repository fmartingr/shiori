# Variables
BINDIR := bin
BINNAME := shiori
CONTAINER_OWNER := fmartingr
CONTAINER_IMAGE_NAME := $(CONTAINER_OWNER)/$(BINNAME)

# Files required by the build
SRCFILES := $(shell find . -type f -name '*.go' -print) go.mod

.EXPORT_ALL_VARIABLES:

# this is godly
# https://news.ycombinator.com/item?id=11939200
.PHONY: help
help:	### this screen. Keep it first target to be default
ifeq ($(UNAME), Linux)
	@grep -P '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
else
	@# this is not tested, but prepared in advance for you, Mac drivers
	@awk -F ':.*###' '$$0 ~ FS {printf "%15s%s\n", $$1 ":", $$2}' \
		$(MAKEFILE_LIST) | grep -v '@awk' | sort
endif

# Targets
#
.PHONY: debug
debug:	### Debug Makefile itself
	@echo $(UNAME)

.PHONY: dockerize
dockerize: build  ### Create docker image
	@docker build -t $(CONTAINER_IMAGE_NAME)/$(BINNAME):latest .

.PHONY: podmanize
podmanize: build  ### Create podman image
	@podman build -t $(CONTAINER_IMAGE_NAME):latest .

.PHONY: build
build: cmd/shiori ### Builds the application

cmd/$(BINNAME): $(SRCFILES)
	@go build -o '$(BINDIR)'/$(BINNAME) -v ./cmd/$(BINNAME)

serve:
	@go run cmd/$(BINNAME)/*.go serve

test:  ### Run go tests
	@go test -v ./...
