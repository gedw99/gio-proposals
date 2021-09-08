# modularity

The current Comonent example has each "Page" all mashed together in the main.go

https://github.com/gioui/gio-example/tree/main/x/component


SO do the following:
- Make a folder for each View, like in Frost.
- Need optional interfaces:

```
type View interface {
    Layout(gtx C) D
}

type AppBarView interface {
    View
    Actions() []AppBarAction
}

if abv, ok := view.(AppBarView); ok {
   appBar.SetActions(abv)
}

```



## Bus

So we have a bus at each level: WASM <--> WASM, Client <--> Server, Server <--> Server

Client <--> Server using WS
https://git.sr.ht/~whereswaldon/pointstar/tree/master/item/client/url.go
- extend: to generic pattern

Server <--> Server && Client <-->Client via the Server bus.
- NATS BUS with Siot: https://github.com/simpleiot/simpleiot/search?q=nats


## Widget gallery


Eventually a Widget Gallery running on Web, Desktop and Mobile would be useful for everyone.

The current gio examples could be used.

https://github.com/emilk/egui has a good example of the cooncept.

dark-theme: 
![alt text](https://raw.githubusercontent.com/emilk/egui/master/media/widget_gallery.gif "Logo Title Text 1")


light-theme: 
![alt text](https://raw.githubusercontent.com/emilk/egui/master/media/light_theme.png "Logo Title Text 1")

