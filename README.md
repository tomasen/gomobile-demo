gomobile demo project for GopherChina 2016

### Build

```
cd GopherDemoIOS/GopherDemoIOS
gomobile bind -target=ios github.com/tomasen/gomobile-demo/sdk

cd GopherDemoAndroid/app/libs
ANDROID_HOME=~/Library/Android/sdk/ gomobile bind -target=android github.com/tomasen/gomobile-demo/sdk

cd GopherDemoOSX/GopherDemoOSX
gomobile bind -target=ios github.com/tomasen/gomobile-demo/sdk


go build -buildmode=c-archive    github.com/tomasen/gomobile-demo/c/hello

go build -buildmode=c-archive    github.com/tomasen/gomobile-demo/c/world
```
