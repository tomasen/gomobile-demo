package GopherKit

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strconv"
	"sync/atomic"
	"time"
)

var (
	callbacks   []Callback
	nanoCounter uint64
	lastmessage string
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
	Message       string
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

	go func() {
		for {
			msg := ""
			res, err := http.Get("http://api.huobi.com/staticmarket/ticker_btc_json.js")
			if err == nil {
				dec := json.NewDecoder(res.Body)
				for {
					t, err := dec.Token()
					if err != nil {
						break
					}
					if t == "last" && dec.More() {
						last, _ := dec.Token()
						msg += fmt.Sprintln("BTC:", last)
						break
					}
					if t == "vol" && dec.More() {
						vol, _ := dec.Token()
						msg += fmt.Sprintln("VOL:", vol)
					}
				}
				res.Body.Close()
				if msg != lastmessage {
					lastmessage = msg
					callback()
				}
			}

			time.Sleep(time.Second)
		}
	}()
}

//GetState export
func GetState() *State {
	return &State{
		NanoTimeStamp: time.Now().UnixNano(),
		NanoCounter:   strconv.Itoa(int(atomic.LoadUint64(&nanoCounter))),
		Message:       lastmessage,
	}
}

func callback() {
	for _, c := range callbacks {
		c.StateDidUpdate()
	}
}
