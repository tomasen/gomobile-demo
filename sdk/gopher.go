package GopherKit

import (
	"io"
	"net/http"
	"regexp"
	"time"
)

var (
	callbacks   []Callback
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
	Message       string
}

//Start timer and counter
func Start() {
	go func() {
		for {
			time.Sleep(time.Millisecond * 10)
			callback()
		}
	}()

	go func() {
		for {
			msg := ""
			res, err := http.Get("http://api.huobi.com/staticmarket/ticker_btc_json.js")
			if err == nil {
				buf := make([]byte, 4096)
				n, _ := io.ReadFull(res.Body, buf)

				vol := regexp.MustCompile(`\"vol\":([0-9\.]+)`)
				b := vol.FindAllStringSubmatch(string(buf[:n]), -1)
				msg += "VOL:" + string(b[0][1]) + "\n"

				btc := regexp.MustCompile(`\"last\":([0-9\.]+)`)
				b = btc.FindAllStringSubmatch(string(buf[:n]), -1)
				msg += "BTC:" + string(b[0][1]) + "\n"

				res.Body.Close()
				if msg != lastmessage {
					lastmessage = msg
					callback()
				}
			} else {
				lastmessage = err.Error()
				callback()
			}

			time.Sleep(time.Second)
		}
	}()
}

//GetState export
func GetState() *State {
	return &State{
		NanoTimeStamp: time.Now().UnixNano(),
		Message:       lastmessage,
	}
}

func callback() {
	for _, c := range callbacks {
		c.StateDidUpdate()
	}
}
