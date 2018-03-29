# Build
FROM golang:alpine AS build

RUN apk add --update git make build-base && \
    rm -rf /var/cache/apk/*

WORKDIR /go/src/plugin
COPY . /go/src/plugin
RUN go get ./... && go build -o plugin .

# Runtime
FROM scratch

COPY --from=build /go/src/plugin/plugin /plugin

ENTRYPOINT ["/plugin"]
CMD []
