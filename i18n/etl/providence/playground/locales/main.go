package main

import (
	"fmt"
	"time"

	"github.com/go-playground/locales/currency"
	"github.com/go-playground/locales/en_CA"
)

func main() {

	loc, _ := time.LoadLocation("America/Toronto")
	datetime := time.Date(2016, 02, 03, 9, 0, 1, 0, loc)

	l := en_CA.New()

	// Dates
	fmt.Println(l.FmtDateFull(datetime))
	fmt.Println(l.FmtDateLong(datetime))
	fmt.Println(l.FmtDateMedium(datetime))
	fmt.Println(l.FmtDateShort(datetime))

	// Times
	fmt.Println(l.FmtTimeFull(datetime))
	fmt.Println(l.FmtTimeLong(datetime))
	fmt.Println(l.FmtTimeMedium(datetime))
	fmt.Println(l.FmtTimeShort(datetime))

	// Months Wide
	fmt.Println(l.MonthWide(time.January))
	fmt.Println(l.MonthWide(time.February))
	fmt.Println(l.MonthWide(time.March))
	// ...

	// Months Abbreviated
	fmt.Println(l.MonthAbbreviated(time.January))
	fmt.Println(l.MonthAbbreviated(time.February))
	fmt.Println(l.MonthAbbreviated(time.March))
	// ...

	// Months Narrow
	fmt.Println(l.MonthNarrow(time.January))
	fmt.Println(l.MonthNarrow(time.February))
	fmt.Println(l.MonthNarrow(time.March))
	// ...

	// Weekdays Wide
	fmt.Println(l.WeekdayWide(time.Sunday))
	fmt.Println(l.WeekdayWide(time.Monday))
	fmt.Println(l.WeekdayWide(time.Tuesday))
	// ...

	// Weekdays Abbreviated
	fmt.Println(l.WeekdayAbbreviated(time.Sunday))
	fmt.Println(l.WeekdayAbbreviated(time.Monday))
	fmt.Println(l.WeekdayAbbreviated(time.Tuesday))
	// ...

	// Weekdays Short
	fmt.Println(l.WeekdayShort(time.Sunday))
	fmt.Println(l.WeekdayShort(time.Monday))
	fmt.Println(l.WeekdayShort(time.Tuesday))
	// ...

	// Weekdays Narrow
	fmt.Println(l.WeekdayNarrow(time.Sunday))
	fmt.Println(l.WeekdayNarrow(time.Monday))
	fmt.Println(l.WeekdayNarrow(time.Tuesday))
	// ...

	var f64 float64

	f64 = -10356.4523

	// Number
	fmt.Println(l.FmtNumber(f64, 2))

	// Currency
	fmt.Println(l.FmtCurrency(f64, 2, currency.CAD))
	fmt.Println(l.FmtCurrency(f64, 2, currency.USD))

	// Accounting
	fmt.Println(l.FmtAccounting(f64, 2, currency.CAD))
	fmt.Println(l.FmtAccounting(f64, 2, currency.USD))

	f64 = 78.12

	// Percent
	fmt.Println(l.FmtPercent(f64, 0))

	// Plural Rules for locale, so you know what rules you must cover
	fmt.Println(l.PluralsCardinal())
	fmt.Println(l.PluralsOrdinal())

	// Cardinal Plural Rules
	fmt.Println(l.CardinalPluralRule(1, 0))
	fmt.Println(l.CardinalPluralRule(1.0, 0))
	fmt.Println(l.CardinalPluralRule(1.0, 1))
	fmt.Println(l.CardinalPluralRule(3, 0))

	// Ordinal Plural Rules
	fmt.Println(l.OrdinalPluralRule(21, 0)) // 21st
	fmt.Println(l.OrdinalPluralRule(22, 0)) // 22nd
	fmt.Println(l.OrdinalPluralRule(33, 0)) // 33rd
	fmt.Println(l.OrdinalPluralRule(34, 0)) // 34th

	// Range Plural Rules
	fmt.Println(l.RangePluralRule(1, 0, 1, 0)) // 1-1
	fmt.Println(l.RangePluralRule(1, 0, 2, 0)) // 1-2
	fmt.Println(l.RangePluralRule(5, 0, 8, 0)) // 5-8
}
