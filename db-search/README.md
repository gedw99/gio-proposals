# DB search

Bleve based indexing.

https://github.com/blugelabs/bluge is a wrapper around bleve that makes things more consistent.

You could also have powerful facet search by sniffing mutations.

If the Server is doing the indexing, it can send you index updates to then store locally. The scorch API could then target the UnifiedDB interface.

Getting the bleve store running inside wasm is also possible. Thats just a matter of targeting the Segment API. 

Providence:

https://github.com/blugelabs/blugelabs.com

- Good example to show what it offers. Essentialyl global search on apps.
https://github.com/blugelabs/beer-search
