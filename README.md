# gio-proposals




It’s designed for developers looking to get going with https://gioui.org/ apps fast.

But also for those interested in extending gio too.

## CI

CI builds all the proposal examples and deploys them. 

- This is useful because users can very quickly see a demo of the code they are looking at.
- Eventually it will host a web, desktop and mobile version of each demo.


## idiomatic aspects of gio 

Also I am starting to focus on what the idiomatic aspects of gio project structure as well as useful patterns.


## audio

Gio needs a decent audio component. 

Oto v2 looks perfect and reuses a well supported existing golang package.

## db

Gio needs a decent DB with no CGO.

Genji supports Desktop and Mobile, Web. For Web it can be compiled with golang wasm or tinygo

Soon it will support an WASM indexedDB based driver too, and so gain persistance for GIo Web.

Genji is unique in that it can support schema and no schema approaches and is a well supported golang package.

## Networking

There are many ways to manage the network aspects in GIO.

GRPC, NATS, Websockets, http, go-kit, etc, etc

## Servers

Many standard things are needed for most projects, and in order for Community Demonstrations to be built up with GIO, some standard serevrs would make it easier.

Making Gio demos that use these servers is the first step.

Then when a demo for GIO needs some server aspect to show a complete demo it can be used.

CI and CD is then also easier for the Demos.

Email

Identity.

DB and File Storage.

Backup
