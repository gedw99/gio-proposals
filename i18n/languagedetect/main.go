package main

import (
	"fmt"
	"github.com/rylans/getlang"
)

func main(){
  info := getlang.FromString("Wszyscy ludzie rodzą się wolni i równi w swojej godności i prawach")
  fmt.Println(info.LanguageCode(), info.Confidence())

