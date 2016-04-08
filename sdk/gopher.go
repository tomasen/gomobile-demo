package GopherKit

import (
	"strconv"
	"sync/atomic"
	"time"
)

var (
	callbacks   []Callback
	nanoCounter uint64
)

//Callback export
type Callback interface {
	StateDidUpdate()
}

//RegisterCallback export
func RegisterCallback(c Callback) {
	// save a copy of c and call DoSomething on it later
	callbacks = append(callbacks, c)
}

//State export
type State struct {
	NanoTimeStamp int64
	NanoCounter   string
}

//Start timer and counter
func Start() {
	atomic.StoreUint64(&nanoCounter, uint64(time.Now().UnixNano()))
	go func() {
		for {
			atomic.AddUint64(&nanoCounter, uint64(time.Millisecond))
			time.Sleep(time.Millisecond)
			callback()
		}
	}()
}

//GetState export
func GetState() *State {
	return &State{
		NanoTimeStamp: time.Now().UnixNano(),
		NanoCounter:   strconv.Itoa(int(atomic.LoadUint64(&nanoCounter))),
	}
}

func callback() {
	for _, c := range callbacks {
		c.StateDidUpdate()
	}
}
