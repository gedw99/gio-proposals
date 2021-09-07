# seo


Dynamic Rendering is the blessed way to do it and is NOT considered cloaking...
https://developers.google.com/search/docs/advanced/javascript/dynamic-rendering

Prerender on Server like here: https://go-app.dev/seo, https://github.com/maxence-charriere/go-app/blob/master/docs/web/documents/seo.md
Go-app is solving that issue by prerendering components on the server-side before including the generated HTML markup into requested pages.

HTML Canvas is NOT not SEO friendly, so forget it.
Canvas uses GIO to Render to HTML-Canvas 
https://github.com/tdewolff/canvas/blob/master/examples/html-canvas/Makefile

## Data Layer

The data layer call that the GIO frontend makes MUST be the same code that Server backend calls.

The Data Layer knows the User identity ( jwt or whatever), and so can return back the content appropriate to that User and so not break Authz security aspects.

So you have a Client and Server side code base. So maybe GRPC-WASM ?

## Routing

The Navigation component is needed to work with the GIO router, so we have a URI ( URL for Web, URI Schema for Desktop and Mobile.)
See the Navigation Folder for that ...

## DSL Layer

I cant see a way of GIO code on the server rendering to HTML without some effort...Options ??

1. Code gen or reflection based AST parser to reconstruct the HTML Page structure ? Its possible but has to be done at the lower layers of the Gio framework

2. A DSL wrapper that is used to build a GIO app or HTML. Thats does not touch the Gio framework.
- like what https://github.com/ajstarks/deck did .
- would need Actions to be formalised so that when rendering to HTML, the actions are ignored. I assuem that HTML renderer does not allow mutations.
- Hyperlinks however do need to be provided, so that Googles SEO knows the page links it can follow.. This is part of the Navigation Spec where the Possible Routes are. Along with that goes Authz guards, so that authz is respected and data leaks cant occur.
- But its cool cause it will create a GIO markup language a bit like what QT has.
- Its also cool cause you can then build an IDE for GIO in GIO golang then.. mhhh..

3. This also gets use PDF, because once the DSL is in place you just need a PDF Renderer also.
- can be run in the GIO app or Server side. Nice...