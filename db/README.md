# GIO DB

Gio needs a good developer story for DB and file system.

## UnifiedDB

In order for GIO devs to have a consistent and first class storage experience targetting the Service worker API's is best way, because its the lowest common denominator and was designed to allow OfflIne first experiences.

https://developer.mozilla.org/en-US/docs/Web/API/Service_Worker_API

Advantages of this are:

- Web, Desktop and Mobile apps would have a base to work from where there are no surprises.

- Offline apps use case would be covered. Offline editing could be visited, but is highly related to the way you model your data and if you seperate the Query IO from the Mutation IO to your backend. I could add more here to explains an approach...

- Some of the GIO packages rely on durbale state, and so they would all just work on all targets.

- CLI, GUI, REPL tooling is then possibe to be build around it. 
  - This would ignore your golang types, but instead show you the raw data in the DB and File store.

- Bleve based indexing. You could also have poweful facet search by sniffing mutations. 
  - If the Server is doing the indexing, it can send you index updates to then store locally. The scorch API could then target the UnifiedDB interface.
  - Getting the bleve store running inside wasm is also possible. Thats just a matter of targeting the Segment API. See the [Search](./..Search) Folder however...


## Example Flow sequences

Flow Sequence to demonstrate the touch points:

Query
- Do a Get in the GUI.
- Does a Get to the Server.
- puts the data into the DB as a cache.
- marked as dirty for event loop to pick up.
- gio event loop renders, and picks up dirty data and processes.

Mutation
- Do mutation in GUI
- optional: do optomistic update to the Data View ( if you have enough knowldge of the Materialised Views)
- save to Server
- server pushes an update from its Materialised View ( or other ) and GUI saves it its DB.
- later, when the user goes to that view they will see the new data in with the other data.



## Providence

## db gui

TODO ...

**hack-pad**

This could also give use a UnifiedDB.

WASM DB

https://github.com/hack-pad/hackpadfs

https://github.com/hack-pad/go-indexeddb

Desktop, Mobile

The excellent github.com/prologic/bitcask project uses https://github.com/syndtr/goleveldb
LevelDB is apparently similar to IndexedDB, and there is a working implementation at https://github.com/hack-pad/go-indexeddb
So, we could get Bitcask working in Web using the hackpad code, as well as on Desktop and Mobile. It would partly depend on how similar the Semantics of LevelDB and IndexDB are.

**Genji DB**

This would also give use a UnifiedDB.

Genji https://github.com/genjidb/genji is a sql and document DB. 

It can run on Desktop, Mobile and Server and Browser WASM. I have been using it quite a bit.

For WASM it uses an inmemory DB, but they are working on an IndexedDB driver for it...
- See https://github.com/genjidb/genji.js 
- tinygo supported: https://github.com/genjidb/genji.js/blob/master/scripts/buildgo.sh#L27
For Mobile and Dekstop it uses BadgerDB.