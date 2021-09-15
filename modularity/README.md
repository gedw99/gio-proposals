# Modularity

Fosucs's on what the idiomatic aspects of gio project structure are as well as useful patterns.

Typically needed for larger apps.

**Table of contents**

- [Pages per folder](#pages-per-folder)
- [Pages per package](#pages-per-package)
- [Widget gallery](#widget-gallery)
- [Responsive](#responsive)
- [Tinygo](#tinygo)
- [Security](#security)
- [Bus](#bus)

## Pages per folder

STATUS: 

- DONE ( PR: https://github.com/gioui/gio-example/commit/82c2219a297cccd13698146ee2eb374faafdbf12 )

- Implications:
    - Router Interface: https://github.com/gioui/gio-example/blob/307f4a062c/component/pages/page.go#L14 that others can start using to allow reuse between projects.
    - We cant use this until other examples implement the interface.

Description:

Introduce the abstractions necessary to split an app into several files and packages in a way that is realistic for how people actually build applications with Gio.

Examples:

The current Component example ( https://github.com/gioui/gio-example/tree/main/component ) has each "Page" all mashed together in the main.go 

## Pages per package

STATUS: 

- Still debating its worth... 
- At the moment because there is no Navigation package this is not easy to do. Perhaps once the Navigation work package is sorted out it may be possible to do this. 

Preconditions: 

- [Pages per folder](#pages-per-folder), is DONE.
- [Naviation: URL handling](../navigation#url-handling) is NOT done.


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


## Responsive

STATUS:

- PENDING. Seems very worthwhile, but approaches to the best way to do it are not worked out.

Preconditions:

- NONE :)

Description:

A desktop and mobile app needs to change aspects of its layout and bahaviour based on the users screen size.

This is really a cross cutting thing in that it is often called "Responsive Design", but thats only a small aspect to it, in that it cuts across all of GIO, and so thats why its part of the Modularity proposal area.

TODO: I think there are some handlers in gio core for this ? Check how to maps to this proposal.

Examples:

There are many permutations of examples of this; way too many to mention. But the following highlights commonalities that effect everyones apps.

- The Navigation ( aka "Rail" in Materials Design terms: https://material.io/components/navigation-rail) needs to change based on screen size.

  - Video: 
  
  ![Response Component](https://kstatic.googleusercontent.com/files/65115e4274f0fae323a231e4697a04e8be28465d68638f40f1cb32bef51d61f442dd0868e4fac23eaee14d123de32b070e0c59dd291e537d4d9d058d368df514)

  [link text](https://example.com/my-link "link title")

- The classic Master / Details pattern ( aka "List/Detail view" in Material Design ) of having a List on the left and a form on the right changes.

  - Image: https://lh3.googleusercontent.com/TYXaIIcQr95JavcPFYELW2BSAMCp2JIvfguH_hSwV_isulVHiydKJjSk3rRrhm7wObJHNBYMKdPZIL1zAnyRFJgDwOTIGYT39oPi4VCNTQzONyGRrvPD=w1064-v0

  - Image: https://lh3.googleusercontent.com/giZtnMxeuuVJB_PzeKuyEaFOAmJ7g1IGvgdthAT5fbXbUYcZKguek7xx7oHhbhcOrLXkJwzaRGrkm4aeMcosyEaRymBraXN7_DhZeRofCMsjqV0Vqw=w1064-v0

  - On Mobile, navigation from Master to Detail Page is a full navigation with back button assertion.

  - On Desktop, there is no navigation, and no back button assertion.

  - As highlighted above, this effects the navigation / routing, in that on Desktop a full URL to a Detail page is /Page/Form?id=formID, must be accounted for in that you need to load the Master and Detail Views. On Mobile, you only load the Detail View. One way to handle this is to formalise this such that there are no code changes and the system autoamtically works this out. But it maybe too restrictive. We shoudl design to have a helper function that can be used as needed perhaps.

Conclusions:

The Master / Detail pattern is general enough that any application needs it in general. Be it a Forms based app or a 2D CAD app, and so we need to formalise it at some level.

It also highlights just how cross cuttong it is affecting Navigation and Routing. If we dont address this there will be too many gio wrappers and forks basically. There are already a few.

Aim for a "responsive" package that is reused higher up in Widgets.

Suggest, we start with the Component package and its handling of the Nav Rail with defaults that can be overriden easily but others. That will tease out what needs to be extended in GIO core responsive package.

Suggest we start to then look at the low hanging fruit for List and Form as they are used in so many apps and we have good examples of them that can be embellished with Responsive behaviours.

- List is still being formalised in the gioverse project at https://github.com/gioverse/chat/tree/main/list

- Form is in good shape in Jacks repo at https://git.sr.ht/~jackmordaunt/gio-planet/tree/main/item/form. We should put this package and example into gio repo to get started.

## Tinygo

STATUS:

- PENDING. Seems very worthwhile.

Preconditions:

- NONE :)

Description:

Adoption by many developerent teams is being held back by the WASM download being too large.

For example, the current Kitchen example is a 3 MB download size with a Time to Interactive of 4.3 sconds.

- Code: https://github.com/gioui/gio-example/tree/main/kitchen

- Light house checking URL: https://developers.google.com/speed/pagespeed/insights/?url=https%3A%2F%2Fgioui.org%2Ffiles%2Fwasm%2Fkitchen%2Findex.html

We should work towards tinygo compilation, and this will bring the WASM download size to approx .3 MB, and decrease the Time to Interactive.

The blockers were minor and to do with Reflection from what i saw.

When this is done gogio tool should add a flag for compiling via tinygo, so that we can check regressions in CI, but also so developers have a choice, as they may also be using some reflection code themsleves ( or other ) that breaks tinygo compilation.

TODO: Add the issues hit.

## Security

STATUS:

- PENDING. Not decided on design fully..

Preconditions:

- NONE, but heavily related to Identity

Description:

Auth, Authz ( user, groups, permissions) and Guards in the GUI are a cross cutting concern and so part of Modularity, and heavily relatd to Navigation and route checking.

Auth is very much different for devlopers, and how they hold a Uses "cookie".  Identity is current broken out because developers need many ways to do Auth, but then once the user is Authenticated, Authz takes over using the "Cookie" they. SO its loosly coupled by design.

AuthZ is where you want to check if a User has the right to do something using the classic "Is a user a member of this group" logic.

Permissions entends on Authz, to also check some data dependency typically. For example, the logic of "is a user in his group and are they the creator of this Order".

Guards are where in the GUI you enforce the checks. This can extend to only showing certain Navigation items ( so hence Component relationship ), to anywhere else deeper in the App.

TODO:

- We already have an Identity Section, Bit what we need is a Modular approhc so that developers can use any implementation that they want. So work on that.

- The above things are all things you need to do in a GUI and on a Server. We can leverage this. But we have teams of course using GIO with other server technologies, and so be mindful of this.

Providence:

- https://github.com/cerbos/cerbos
  - Example: https://github.com/cerbos/demo-rest
    - Auth Check: https://github.com/cerbos/demo-rest/blob/main/service/service.go#L95
    - Authz and Permissions: https://github.com/cerbos/demo-rest/blob/main/service/service.go#L167
  - This is a loose coupled design and can be leveraged on the Client and Server or not, which is what we want.
  - github.com/open-policy-agent/opa based, which is a flexible approach and has long legs.
    - has WASM support. Pretty cool :) : https://github.com/open-policy-agent/opa/blob/main/features/wasm/wasm.go
    - has wasmtime-go support too for Servers using WASM rather than dockr for example.
    - compiling a policy to wasm doesn't depend on any of wasmtime-go, Good !

## Bus

STATUS:

- Seems worthwhile. Needs more work..

Preconditions: 

- NOT DECIDED YET

Description:

So we have a bus at each level: Client <--> Client, Client <--> Server, Server <--> Server

**Client <--> Client** may be useful for Modularity in that you can send a message to another package that you have no knowldge of. 
Its  designed for decoupling of Application to allow reuse and hence Modularity.

Its maps to the Web Service worker pattern ( https://developer.mozilla.org/en-US/docs/Web/API/Client/postMessage ) and so would provide compile target agnostics to this feature, allowing this bus feature to work cross platform.

Examples:
- TODO

**Client <--> Server** using various protocols, is designed to provide a generic pattern for Unidirectional messge push in a decoupled and modular way, allowing maximum reuse and developer productivity.  In so doing it would provide compile target agnostics to this feature. 

Examples:

- https://git.sr.ht/~whereswaldon/pointstar/tree/master/item/client/url.go

- https://centrifugal.dev/docs/transports/overview
  - GRPC, SSE, HTTP Streaming, GRPC

**Server <--> Server && Client <--> Client** using NATS ( for example ), provides a pattern where by messages can be send between clients via a server.

Examples:

- NATS BUS with Siot: https://github.com/simpleiot/simpleiot/search?q=nats


