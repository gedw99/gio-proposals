# Modularity

Fosucs's on what the idiomatic aspects of gio project structure are as well as useful patterns.

Typically needed for larger apps.

## Pages per folder

STATUS: 

- DONE ( PR: https://github.com/gioui/gio-example/commit/82c2219a297cccd13698146ee2eb374faafdbf12 )

- Implications:
    - Router Interface: https://github.com/gioui/gio-example/blob/307f4a062c/component/pages/page.go#L14 that others can start using to allow reuse between projects.
    - We cant use this until other examples implement the interface.

Description:

Introduce the abstractions necessary to split an app into several files and packages in a way that is realistic for how people actually build applications with Gio.

Examples:

The current Comonent example ( https://github.com/gioui/gio-example/tree/main/x/component ) has each "Page" all mashed together in the main.go

## Pages per package

STATUS: 

- Still debating its worth... 
- At the moment because there is no Navigation package this is not easy to do. Perhaps once the Navigation work package is sorted out it may be possible to do this. 

Preconditions: 

- [Pages per folder](#pages-per-folder), is DONE.
- [Naviation with URLS](#navigation-with-urls) is not done.

Description:

Say you have built a Package that handles all the LoginIn, SignIn, format password GUI and functionality, and you want to reuse it for all your other apps.

## Widget gallery

STATUS:

- Seems worthwhile 

Preconditions: 

- [Pages per folder](#pages-per-folder), is DONE, however we cant make a Widget gallery until other examples implement the interface.
- [Pages per package](#pages-per-package) makes it way easier to import other examples.

Description:

Eventually a Widget Gallery running on Web, Desktop and Mobile would be useful for everyone.

The current gio examples could be used. 

Examples:

- https://github.com/emilk/egui has a good example of the concept.

dark-theme: 
![alt text](https://raw.githubusercontent.com/emilk/egui/master/media/widget_gallery.gif "Logo Title Text 1")


light-theme: 
![alt text](https://raw.githubusercontent.com/emilk/egui/master/media/light_theme.png "Logo Title Text 1")



## Bus

STATUS:

- Seems worthwhile 

Preconditions: 

- NOT DECIDED YET

Description:

So we have a bus at each level: Client <--> Client, Client <--> Server, Server <--> Server

**Client <--> Client** may be useful for Modularity in that you can send a message to another package that you have no knowldge of. 
Its  designed for decoupling of Application to allow reuse and hence Modularity.

Its maps to the Web Servcie worker pattern ( https://developer.mozilla.org/en-US/docs/Web/API/Client/postMessage ) and so would compile target agnostics to this feature.


**Client <--> Server** using various protocols, is designed to provide a generic pattern for Unidirectional messge push  in a decoupled and modular way, allow maximum reuse and developer productivity.  In so doing t woudl provide compile target agnostics to this feature. 

 https://git.sr.ht/~whereswaldon/pointstar/tree/master/item/client/url.go


**Server <--> Server && Client <--> Client** using NATS ( for example ), provides a pattern where by messages can be send between cleints via a server.

- NATS BUS with Siot: https://github.com/simpleiot/simpleiot/search?q=nats
