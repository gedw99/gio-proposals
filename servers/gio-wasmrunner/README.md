# gio wasm runner


gigio tool already prodcues the index.html and the wasm, so we just need to be able to

- serve it lcoally.

- upload to github pages.

- trigger to rebuild like wasmserve (below) is useful ?. This will require calling "gogio build" assuming its installed, and matching all the args gogio supports.

Pkg folder has it as a package, so it can be reused in larger project.

Cmd folder runs it

- pass in a URL

- Embed WASM inside ? Useful for running on cloudrun, etc where you have no file system.

Will eventually be put into gio/x and gio/examples


https://github.com/gioui/gio/tree/main/cmd/gogio


## Sponsorship

Is very simple so can make a sponsorship for this.

## Providence

https://github.com/hajimehoshi/wasmserve

