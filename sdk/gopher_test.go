package GopherKit

import (
	"fmt"
	"os"
	"testing"
	"time"
)

type demo struct {
	ch chan string
}

func TestStart(t *testing.T) {
	ch := make(chan string, 1)
	RegisterCallback(&demo{ch})
	Start()
	go func() {
		time.Sleep(time.Second * 10)
		t.Fail()
		os.Exit(1)
	}()
	for {
		s := <-ch
		if len(s) != 0 {
			fmt.Println(s)
			return
		}
	}
}

func (d *demo) StateDidUpdate() {
	state := GetState()
	d.ch <- state.Message
}
