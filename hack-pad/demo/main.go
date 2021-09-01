package main

import (
	"os"

	"github.com/hack-pad/hush"
)

func main() {
	exitCode := hush.Run()
	os.Exit(exitCode)
}
