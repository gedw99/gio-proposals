# modularity

Fosucs's on what the idiomatic aspects of gio project structure are as well as useful patterns.

Code and patterns for buildng modular gio apps. Typically needed for larger apps.

## Pages per folder

STATUS: DONE ( PR: https://github.com/gioui/gio-example/commit/82c2219a297cccd13698146ee2eb374faafdbf12 ) 

The current Comonent example ( https://github.com/gioui/gio-example/tree/main/x/component ) has each "Page" all mashed together in the main.go

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

## Pages importable

STATUS: NOT YET. Other things are needed first like the Navigator.

Say you have built a Package that handles all the LoginIn, SignIn, format password GUI and functionality, and you want to reuse it for all your other apps.

At the moment because their is no Navigation package this is nto easy to do. Perhaps once the Navigation work package is sorted out it may be possible to do this.

## Bus

So we have a bus at each level: Client <--> Client, Client <--> Server, Server <--> Server

**Client <--> Client** may be useful for Modularity in that you can send a message to another package that you have no knowldge of. 
Its  designed for decoupling of Application to allow reuse and hence Modularity.

Its maps to the Web Servcie worker pattern ( https://developer.mozilla.org/en-US/docs/Web/API/Client/postMessage ) and so would compile target agnostics to this feature.


**Client <--> Server** using various protocols, is designed to provide a generic pattern for Unidirectional messge push  in a decoupled and modular way, allow maximum reuse and developer productivity.  In so doing t woudl provide compile target agnostics to this feature. 

 https://git.sr.ht/~whereswaldon/pointstar/tree/master/item/client/url.go


**Server <--> Server && Client <--> Client** using NATS ( for example ), provides a pattern where by messages can be send between cleints via a server.

- NATS BUS with Siot: https://github.com/simpleiot/simpleiot/search?q=nats


## Widget gallery

Eventually a Widget Gallery running on Web, Desktop and Mobile would be useful for everyone.

Precondition: Pages per folder

[Pages per folder](#pages-per-folder) click

[click on this link](#my-multi-word-header)

Allowing pages to be imported, woudl allow this to be done easily against others repos. We woudl just need to bypass the main.go

The current gio examples could be used.

Examples:

- https://github.com/emilk/egui has a good example of the concept.

dark-theme: 
![alt text](https://raw.githubusercontent.com/emilk/egui/master/media/widget_gallery.gif "Logo Title Text 1")


light-theme: 
![alt text](https://raw.githubusercontent.com/emilk/egui/master/media/light_theme.png "Logo Title Text 1")

