DB and file system running in web using goang wasm.

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


Concepts: 
https://materialize.com/