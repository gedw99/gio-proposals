# backup

All devs and users need a place to backup their files and data to.

https://github.com/swampapp/swamp
- uses restic and rclone
- has a cli
- can build a gio gui for it.
- uses bleve for search, nice.
- only supports local (filesystem), rest-server and S3 repositories. Support for all the repository backends supported by Restic will be added soon, before the final release.
- The gui uses an event bus (https://github.com/swampapp/swamp/blob/master/docs/eventbus.md) to allow components to talk to each other. 
  - Each UI component may emit its own events and listen to other component events.
  - We should use the same for gio as it will nicely decouple things. Probably a decent addition to the Router later maybe...