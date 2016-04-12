package main

import "C"

//export World
func World(s string) string {
	ch := make(chan string, 1)
	go func() {
		ch <- "world"
	}()
	return <-ch
}

func main() {}
