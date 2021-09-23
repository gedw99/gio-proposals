# i18n

## Pref

**Detect Lang** - MAC and IOS are not supported.

**Battery** -MAC and IOS are not supported.

might as well also do this.

## Lang Detection

Useful for some scenarios like chat systems where at runtime you need to work out what languages they are writing in. 

In a gio system, you can of course their locale and assume they write in that language.



## ETL

Extraction using ast parsing for Text.

Transformation to what format ?

Load back in as golang files to give a strongly typed API to your translated data.

DO you want the files embedded or to call a server for them ?

https://github.com/go-playground/universal-translator
- mature
- does not generate goalng files.
- incorproated into validation: https://github.com/go-playground/validator/blob/master/_examples/translations/main.go
  - works with https://git.sr.ht/~jackmordaunt/gio-planet/tree/main/item/form ?

https://github.com/razor-1/cldr
- does generate golang files.

## UOM

Some of this can be part of the Lang because the known units are well known. For examples Dates and Currency.

### DateTime

Reformat it to the users locale.

Local display of Dates (In local timezone or given timezone).



### Currency

Reformat it to the users locale.

### Address

Reformat it to the users locale.

https://github.com/bojanz/address



