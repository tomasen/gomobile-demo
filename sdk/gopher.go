package GopherKit

import (
	"sync/atomic"
	"time"
)

var (
	states      = &State{}
	callbacks   []Callback
	nanoCounter uint64
)

//export Callback
type Callback interface {
	StateDidUpdate()
}

//export State
type State struct {
	NanoTimeStamp int
	NanoCounter   int
}

//export Start
func Start() {
	atomic.StoreUint64(&nanoCounter, uint64(time.Now().Nanosecond()))
	go func() {
		for {
			atomic.AddUint64(&nanoCounter, uint64(time.Millisecond))
			time.Sleep(time.Millisecond)
			callback()
		}
	}()
}

//export RegisterCallback
func RegisterCallback(c Callback) {
	// save a copy of c and call DoSomething on it later
	callbacks = append(callbacks, c)
}

//export GetState
func GetState() *State {
	return &State{
		NanoTimeStamp: time.Now().Nanosecond(),
		NanoCounter:   int(atomic.LoadUint64(&nanoCounter)),
	}
}

func callback() {
	for _, c := range callbacks {
		c.StateDidUpdate()
	}
}
