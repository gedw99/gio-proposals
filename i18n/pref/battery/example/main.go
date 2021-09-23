package main

import (
	"fmt"
	//"gioui.org/x/pref/battery"
	"battery"

	"battery"
)

func main() {
	// GIo generic fails
	//fmt.Printf("Battery is charging ? %v", battery.IsCharging)

	// Darwin specific
	fmt.Printf("Battery is charging ? %v", battery.IsCharging())

}
