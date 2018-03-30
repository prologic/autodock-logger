# Build
FROM golang:alpine AS build

RUN apk add --update git make build-base && \
    rm -rf /var/cache/apk/*

WORKDIR /go/src/autodock-logger
COPY . /go/src/autodock-logger
RUN go get ./... && go build .

# Runtime
FROM scratch

COPY --from=build /go/src/autodock-logger/autodock-logger /autodock-logger

ENTRYPOINT ["/autodock-logger"]
CMD []
