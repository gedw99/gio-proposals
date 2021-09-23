package main

import (
	"fmt"
	"time"

	//"github.com/razor-1/cldr/resources/currency"

	"golang.org/x/text/language"

	"github.com/razor-1/localizer"

	
)

var langTag = language.Make("es")
var date = time.Date(2020, 1, 1, 0, 0, 0, 0, time.UTC)
var currency = "USD"
var currencyAmount = 10000.12
var addressFull = "2375 Pennsylvania Avenue NW, Washington, DC 20037, USA" // Embassy of Spain

func main() {

	fmt.Println("")
	fmt.Println("Preferences: ")
	fmt.Println("Lang: " + langTag.String())
	fmt.Println("Date: " + date.String())
	fmt.Println("Currency: " + currency)
	fmt.Println("Currency Amount: " + fmt.Sprintf("%f", currencyAmount))
	fmt.Println("Address Full: " + addressFull)

	// Assign lang to localiser
	l, err := localizer.NewLocale(langTag)
	// or typed langTag
	//l, err := localizer.NewLocale(language.Arabic)
	if err != nil {
		panic(err)
	}

	// Get the formatted display name for the provided language tag in the locale.
	fmt.Println("")
	fmt.Println("-- Lang --")
	localeName := l.DisplayName(langTag)
	fmt.Printf("DisplayName: %s", localeName)
	fmt.Println("")

	// Dates

	// Format it to the users locale

	month, err := l.Calendar.Format(date, "MMMM")
	if err != nil {
		panic(err)
	}

	fmt.Println("")
	fmt.Println("-- Dates --")

	fmt.Println("-- Month --")
	fmt.Println("Date month: " + month)                                               // "enero"
	fmt.Println("Date Wide:" + l.Calendar.FormatNames.Months.Wide.Jan)                // "enero"
	fmt.Println("Date Narrow: " + l.Calendar.FormatNames.Months.Narrow.Jan)           // "E"
	fmt.Println("Date Abbreviated: " + l.Calendar.FormatNames.Months.Abbreviated.Jan) // "ene"
	fmt.Println("")

	// Currency
	fmt.Println("")
	fmt.Println("-- Currency --")
	fmt.Println("Amount: " + l.FmtNumber(currencyAmount)) // "10.000,12"

	// Currency Conversion
	currency := l.Number.Currencies["USD"]
	fmt.Println("DisplayName: " + currency.DisplayName) // {dólar estadounidense US$}
	fmt.Println("Symbol: " + currency.Symbol)           // {dólar estadounidense US$}

	cur, err := l.FmtCurrency("USD", 10000.12)
	if err != nil {
		panic(err)
	}
	fmt.Println("Amount: " + cur) // "10.000,12 US$"

	// Territories
	fmt.Println("")
	fmt.Println("-- Territories --")
	localeTer := l.DisplayName(language.Albanian)
	//localeTer := l.Territories["002"]
	fmt.Println("Name: " + localeTer)


}
