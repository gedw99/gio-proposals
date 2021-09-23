package main

import (
	"log"
	"os"
	"sync"

	"gioui.org/app"
	"gioui.org/font/gofont"
	"gioui.org/io/system"
	"gioui.org/layout"
	"gioui.org/op"
	"gioui.org/unit"
	"gioui.org/widget/material"
	"gioui.org/x/component"
	"git.sr.ht/~jackmordaunt/gio-planet/form"
	"git.sr.ht/~jackmordaunt/gio-planet/form/value"
)

func main() {
	go func() {
		if err := loop(); err != nil {
			log.Fatal(err)
		}
		os.Exit(0)
	}()
	app.Main()
}

func loop() error {
	var (
		w   = app.NewWindow(app.Title("form"), app.Size(unit.Dp(400), unit.Dp(600)))
		ops op.Ops
	)
	for event := range w.Events() {
		switch event := event.(type) {
		case system.DestroyEvent:
			return event.Err
		case system.FrameEvent:
			layoutUI(layout.NewContext(&ops, event))
			event.Frame(&ops)
		}
	}
	return nil
}

type (
	C = layout.Context
	D = layout.Dimensions
)

var th = material.NewTheme(gofont.Collection())

// Person contains the structured data.
type Person struct {
	Age    int
	Name   string
	Salary float64
}

// PersonForm implements a gui form by that maps to Person state.
type PersonForm struct {
	form.Form
	// Model contains the structured data.
	Model Person
	// Inputs contains the input state.
	Inputs struct {
		Age    component.TextField
		Name   component.TextField
		Salary component.TextField
	}
	once sync.Once
}

func (pf *PersonForm) Update() {
	pf.once.Do(func() {
		// Map the inputs to strongly typed variables stored on the model.
		// This only needs to happen once.
		pf.Form.Load([]form.Field{
			{
				// Values can have arbitrary state.
				Value: value.Int{Value: &pf.Model.Age, Default: 18},
				Input: &pf.Inputs.Age,
			},
			{
				// Values are composable.
				Value: value.Required{Value: value.Text{Value: &pf.Model.Name}},
				Input: &pf.Inputs.Name,
			},
			{
				Value: value.Float{Value: &pf.Model.Salary},
				Input: &pf.Inputs.Salary,
			},
		})
	})
	// Validate tells the form to go through all fields and validate them, in
	// turn processing all events.
	pf.Validate()
}

// Allocate form state.
var (
	pf PersonForm
)

// layoutUI implements the user interface.
// NOTE: component.TextField api likely to change soon.
func layoutUI(gtx C) D {
	pf.Update()
	return layout.UniformInset(unit.Dp(12)).Layout(gtx, func(gtx C) D {
		return layout.Flex{Axis: layout.Vertical}.Layout(
			gtx,
			layout.Rigid(func(gtx C) D {
				return pf.Inputs.Name.Layout(gtx, th, "Name")
			}),
			layout.Rigid(func(gtx C) D {
				return pf.Inputs.Age.Layout(gtx, th, "Age")
			}),
			layout.Rigid(func(gtx C) D {
				pf.Inputs.Salary.Prefix = func(gtx C) D {
					return material.Body1(th, "$").Layout(gtx)
				}
				return pf.Inputs.Salary.Layout(gtx, th, "Salary")
			}),
		)
	})
}