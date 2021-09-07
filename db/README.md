# GIO DB

DB and file system running in web using golang wasm.

why bother ?

Cause in gio, when you switch pages, you can call the DB, and so not have to worry about state.
The DB holds the data that the views depend on. Its really a cache.
For example a background task might have updated soem data, and the Page / View that used that data was not running.
So, this way you can easily built GUI that is real time with updates to the Views happening in the background.

FLow Sequence to demonstrate:

- do a Get from the GUI.
- Does a Get to the Server.
- puts the data into the DB.
- gio event loop renders, and picks up the DB data.

- do mutation in GUI
- optional: do optomistic update to the Data View ( if you have enough knowldge of the Materialised Views)
- save to Server
- server pushes an update from its Materialised VIews ( or other ) and GUI savs it its DB.
- later, when the user goes to that view they will see the new data in with the other data.

Other cool things:

- You can also then update your bleve indexes also locally. The Server is doing the indexing, and so its can send you index updates to then store locally.
  - getting the bleve store running inside wasm is a bit too much, so we let the server do it and just send index updates to the clients.
  - After all the Server holds Materialised views of all the data.

- You can then do offline. 


Genji DB 
- https://github.com/genjidb/genji
- Provides a no CGO based SQL and docuemnt store
- Can run on Web WASM ( in memory only), Desktop and Mobile.
- The hackpad project has a IndexedDB implemenation for WASM and so Genji will be addign this in order to allow genji to also support Web WASM durable db use cases
  - See https://github.com/genjidb/genji.js

Concepts: 
https://materialize.com/

Fyne gui for sql management ! Can be userd for Server or Client.
This woudl allow a developer to see exactly what is inside their app. The page to acess this would be behind a auth guard.
https://github.com/airplayx/gormat

