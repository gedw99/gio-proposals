package about

import (
	"gioui.org/layout"
	"gioui.org/widget/material"
)

const (
	sponsorEliasURL          = "https://github.com/sponsors/eliasnaur"
	sponsorChrisURLGitHub    = "https://github.com/sponsors/whereswaldon"
	sponsorChrisURLLiberapay = "https://liberapay.com/whereswaldon/"
)

// Lays out the page.
func LayoutPage(gtx layout.Context, th *material.Theme) layout.Dimensions {
	//th := *th
	//th.Palette = currentAccent
	return layout.Flex{
		Alignment: layout.Middle,
		Axis:      layout.Vertical,
	}.Layout(gtx,
		layout.Rigid(func(gtx layout.Context) layout.Dimensions {
			return inset.Layout(gtx, material.Body1(th, `This library implements material design components from https://material.io using https://gioui.org.

If you like this library and work like it, please consider sponsoring Elias and/or Chris!`).Layout)
		}),
		layout.Rigid(func(gtx layout.Context) layout.Dimensions {
			return layout.Flex{Alignment: layout.Middle}.Layout(gtx,
				layout.Flexed(settingDetailsColumnWidth, func(gtx C) D {
					return inset.Layout(gtx, material.Body1(&th, "Try another theme:").Layout)
				}),
				layout.Flexed(settingNameColumnWidth, func(gtx C) D {
					return inset.Layout(gtx, material.Switch(&th, &alternatePalette).Layout)
				}),
			)
		}),
		layout.Rigid(func(gtx layout.Context) layout.Dimensions {
			return layout.Flex{Alignment: layout.Middle}.Layout(gtx,
				layout.Flexed(settingDetailsColumnWidth, func(gtx C) D {
					return inset.Layout(gtx, material.Body1(&th, "Elias Naur can be sponsored on GitHub at "+sponsorEliasURL).Layout)
				}),
				layout.Flexed(settingNameColumnWidth, func(gtx C) D {
					if eliasCopyButton.Clicked() {
						clipboardRequests <- sponsorEliasURL
					}
					return inset.Layout(gtx, material.Button(&th, &eliasCopyButton, "Copy Sponsorship URL").Layout)
				}),
			)
		}),
		layout.Rigid(func(gtx layout.Context) layout.Dimensions {
			return layout.Flex{Alignment: layout.Middle}.Layout(gtx,
				layout.Flexed(settingDetailsColumnWidth, func(gtx C) D {
					return inset.Layout(gtx, material.Body1(&th, "Chris Waldon can be sponsored on GitHub at "+sponsorChrisURLGitHub+" and on Liberapay at "+sponsorChrisURLLiberapay).Layout)
				}),
				layout.Flexed(settingNameColumnWidth, func(gtx C) D {
					if chrisCopyButtonGH.Clicked() {
						clipboardRequests <- sponsorChrisURLGitHub
					}
					if chrisCopyButtonLP.Clicked() {
						clipboardRequests <- sponsorChrisURLLiberapay
					}
					return inset.Layout(gtx, func(gtx C) D {
						return layout.Flex{}.Layout(gtx,
							layout.Flexed(.5, material.Button(&th, &chrisCopyButtonGH, "Copy GitHub URL").Layout),
							layout.Flexed(.5, material.Button(&th, &chrisCopyButtonLP, "Copy Liberapay URL").Layout),
						)
					})
				}),
			)
		}),
	)
}
