.PHONY: dev build image test deps clean

CGO_ENABLED=0
COMMIT=`git rev-parse --short HEAD`
APP=autodock-logger
REPO?=prologic/$(APP)
TAG?=latest
BUILD?=-dev

all: dev

dev: build
	@./$(APP) -debug

build: clean deps
	@go build -tags "netgo static_build" -installsuffix netgo .

image: clean deps
	@docker build -t $(REPO):$(TAG) .
	@echo "Image created: $(REPO):$(TAG)"

profile:
	@go test -cpuprofile cpu.prof -memprofile mem.prof -v -bench .

bench:
	@go test -v -bench .

test:
	@go test -v -race -cover -coverprofile=coverage.txt -covermode=atomic .

clean:
	@git clean -f -d -X
