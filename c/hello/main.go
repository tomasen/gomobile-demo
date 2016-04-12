package main

import "C"

//export Hello
func Hello() string {
	return "hello"
}

func main() {}
