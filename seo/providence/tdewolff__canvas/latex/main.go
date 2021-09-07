package main

import (
	"os"

	"github.com/go-latex/latex/drawtex/drawimg"
	"github.com/go-latex/latex/mtex"
)

func main() {
	f, err := os.Create("output.png")
	if err != nil {
		panic(err)
	}
	defer f.Close()

	dst := drawimg.NewRenderer(f)
	err = mtex.Render(dst, `$f(x) = \frac{\sqrt{x +20}}{2\pi} +\hbar \sum y\partial y$`, 12, 72, nil)
	if err != nil {
		panic(err)
	}

	err = f.Close()
	if err != nil {
		panic(err)
	}
}
