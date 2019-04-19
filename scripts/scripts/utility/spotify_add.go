package main

import (
	"encoding/base64"
	"fmt"
)

func main() {
	getClientString()
}

func getClientString() {
	cID := "1b4882f18b5844c18f2b50790dde0bc1"
	cSecret := "f3c13ff95c604199b2139cc165b5f73a"
	c64 := cID + ":" + cSecret
	c64 = base64.StdEncoding.EncodeToString([]byte(c64))
	fmt.Print(c64)
}
