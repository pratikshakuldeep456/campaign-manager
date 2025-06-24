package main

import (
	"log"
	"os"
	"pratikshakuldeep456/campaign-manager/internal/server"

	"github.com/urfave/cli/v2"
)

func main() {

	app := &cli.App{
		Name:  "campaign-manager",
		Usage: "campaign-manager cli",
		Commands: []*cli.Command{
			{
				Name:   "server",
				Usage:  "start the server",
				Action: server.StartServer,
			},
		},
	}

	if err := app.Run(os.Args); err != nil {
		log.Fatal(err)
	}
}
