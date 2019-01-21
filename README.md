# autodock-logger

[![Build Status](https://cloud.drone.io/api/badges/prologic/autodock-logger/status.svg)](https://cloud.drone.io/prologic/autodock-logger)

Logger plugin for autodock (*reference implementation*).

:bulb: See [autodock](https://github.com/prologic/autodock) for more info.

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

## License

autodock-logger is MIT licensed.
