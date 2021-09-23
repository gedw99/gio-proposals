package main

import (
	"errors"
	"fmt"

	"gioui.org/x/pref/locale"
	"gioui.org/x/pref/theme"
)

func main() {

	// Commented out because gio pref does not support MAC or IOS
	// https://github.com/gioui/gio-x/tree/main/pref/locale
	// Detect their runtime local

	fmt.Println("locale test ... ")
	langTag, err := locale.Language()
	if err != nil {
		handled := false
		// Check if error is a specific type
		if errors.Is(err, locale.ErrNotAvailableAPI) {
			fmt.Println("ErrNotAvailableAPI")
			handled = true
		}

		if errors.Is(err, locale.ErrUnknownLanguage) {
			fmt.Println("ErrUnknownLanguage, so defaulting to English, or leting you pick the one you pref.")
			handled = true
		}

		if !handled {
			// Unwrap error
			unwrappedErr := errors.Unwrap(err)
			fmt.Printf("unwrapped error: %v \n", unwrappedErr)
		}
	} else {
		fmt.Println("locale found :)")
		fmt.Println(langTag.String())
	}

	// Commented out because gio pref does not support MAC or IOS
	// https://github.com/gioui/gio-x/tree/main/pref/theme
	// Detect their theme

	fmt.Println("theme test ... ")
	themeDark, err := theme.IsDarkMode()
	if err != nil {
		// Check if error is a specific type
		if errors.Is(err, theme.ErrNotAvailableAPI) {
			fmt.Println("ErrNotAvailableAPI")
		} else {
			// Unwrap error
			unwrappedErr := errors.Unwrap(err)
			fmt.Printf("unwrapped error: %v \n", unwrappedErr)
		}
	} else {
		fmt.Println("theme found :)")
		fmt.Printf("Dark theme set: %v", themeDark)
	}

}
