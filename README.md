# autodock-logger

[![Image Layers](https://badge.imagelayers.io/prologic/autodock-logger:latest.svg)](https://imagelayers.io/?images=prologic/autodock-logger:latest)

Logger plugin for autodock (*reference implementation*).

autodock-logger is MIT licensed.

> **note**
>
> Please see [autodock](https://github.com/prologic/autodock) for the main project and file issues there.

## Building

From source:
```#!bash
$ go build .
```

Using Docker:
```#!bash
$ docker build -t autodock-logger .
```

## Usage

From source:
```#!bash
$ ./autodock-logger -h <autodock_host>
```

Using Docker:
```#!bash
$ docker run -d autodock-logger -H <autodock_host>
```
