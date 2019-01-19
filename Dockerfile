# Build
FROM golang:alpine AS build

RUN apk add --no-cache -U git make build-base

WORKDIR /src/autodock-logger
COPY . /src/autodock-logger
RUN make build install

# Runtime
FROM alpine:latest

COPY --from=build /go/bin/autodock-logger /autodock-logger

ENTRYPOINT ["/autodock-logger"]
CMD []
