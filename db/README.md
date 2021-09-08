# GIO DB

Gio needs a good developer story for DB and File system aspects.

## UnifiedDB

Targeting the IndexedDB and caching API of Web Browsers.

The Service Worker API manages some of these aspects like background Sync, etc.

It would not be hard to provide the same semantics for Mobile and Desktop using built tags to get this Unification.

https://developer.mozilla.org/en-US/docs/Web/API/Service_Worker_API

Advantages of this are:

- Web, Desktop and Mobile apps would have a base to work from where there are no surprises. 

- Offline apps use case would be covered. Offline editing could be visited, but is highly related to the way you model your data and if you seperate the Query IO from the Mutation IO to your backend. I could add more here to explains an approach... IndexedDB access is available within your service worker, where localStorage is not. This does mean you can intercept the network request to the more 'binary' responses and cache them in IDB in the service worker and sort of build a special caching abstraction layer to make managing their caching easier across different browsers.

- Some of the GIO packages rely on durable state to function, and so they would all just work on all targets.

- CLI, GUI, REPL tooling is then possibe. This would ignore your golang types, but instead show you the raw data in the DB and File store.
  - Helps with debugging, as Service worker has race conditions and self manages things and so it can be hard to diagnose what its doing.
  - Makes it easy to write unit / integration tests that test across all Targets.


## Search

See the db-search folder

## Notificatins

At this point in time Apple's iPhone and iPads do not support native push notifications. You can gracefully fallback to SMS notifications. Both provide high engagement levels with minimal costs.

## Background Sync

As for background sync this is a bummer. However, this is not supported by browsers outside the Chromium ecosystem at the moment.

You can create your own synchronization support by leveraging offline detection and IndexedDB. The main drawback here is the user will need to open your web app in order for your fallback to work. You cannot trigger the service worker to just execute in the background when the network returns, which is the main feature of the service worker background sync API.

## A2HS

Add to Home screen.

Works on all desktop and mobiles, giving a siialr experience to an installed app.

If the user does this, the background sync and purging works much better. See IOS quirks



## IOS quirks

Another quirk PWAs have on iOS is being purged. This can be very problematic.

Recently Apple has addressed this problem. When a PWA is added to the user's homescreen the platform will retained cached assets for an indefinite period. Even more incentive too push users to install your PWA.

Because Apple assumes space on its devices is cramped, they aggressively throw unused items overboard to free up disk space. Add to homescreen seems to be a signal to the operating system the assets are more important, therefor they are retained.

If your PWA or any website for that matter, goes unused for a few days (we think it is roughly 14 days, it is not documented) the device will remove all cached assets associated with the origin. This includes IndexedDB, service worker cache, localStorage, etc. Again, this concerns sites not added to the homescreen ( see A2HS)

This has made relying on cached assets a bit of an issue. The real problem lies when a user might try to load your PWA while they are offline for the first time in a month. The PWA won’t work, even if your service worker pre-caches all the required files for offline functionality.

You should also build in a check for purged cached assets in your service worker. I think just important is you should also include some sort of notice for your users if they expect the application to function offline.

Let them know the content they are caching now may not be available if unused for a long period of time. If they anticipate needing your app for offline usage try to plan ahead.

In theory your cached content could be purge by other browsers too, but they are not as aggressive. Providing a message to set user expectations can go a long way to curb potential issues down the road.

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