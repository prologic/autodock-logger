package main

import (
	"os"
	"os/signal"
	"syscall"
	"time"

	log "github.com/sirupsen/logrus"

	"github.com/prologic/autodock/plugin"
)

// LoggerPlugin ...
var LoggerPlugin = &plugin.Plugin{
	Name:    "LoggerPlugin",
	Version: "0.0.1",
	Description: `LoggerPlugin is a reference implementation plugin for
	autodock for plugin authors and maintainers to use as a guide for building
	and maintaining new and interesting plugins for autodock.`,
	Run: func(ctx plugin.Context) error {
		ctx.On("container", func(id uint64, payload []byte, created time.Time) error {
			log.Infof("id=%v payload=%s created=%v", id, payload, created)
			return nil
		})

		sigs := make(chan os.Signal, 1)
		signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM)
		sig := <-sigs
		log.Infof("caught %s, shutting down ...", sig)
		return nil
	},
}

func main() {
	log.Fatal(LoggerPlugin.Execute())
}
