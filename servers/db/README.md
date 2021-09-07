# db



Lets try _ "modernc.org/sqlite"
https://pkg.go.dev/modernc.org/sqlite?utm_source=godoc
- no cgo, and so GIO friendly.
- Desktop and Mobile if you want. Needs trying

Import is: _ "modernc.org/sqlite"

## Orms ?

Ent is starting to use it
- Only discussion: https://github.com/ent/ent/discussions/1667
- Examples:
  - https://github.com/ent/ent/discussions/1667#discussioncomment-1156888
    - https://github.com/xiaoqidun/entps

Gorm heavily uses it
- https://github.com/go-gorm/sqlite
- Examples: https://github.com/search?q=gorm.io%2Fdriver%2Fsqlite&type=code

## HA & Replication ?

LiteStream also has it working. Makes devs life much easier. 
- You can teardown your Server, and boot it up anywhere else and it just gets the data seamlessly.
- Works on Herok and fly, which are 2 easy to run platforms.
- https://github.com/benbjohnson/litestream/issues/28
- can run inside docker or outside.
- docs: http://tip.litestream.io/guides/docker/
- s6 overlay looks very useful.

Examples:

https://mtlynch.io/litestream/
https://github.com/mtlynch/logpaste
- NOT using "modernc.org/sqlite"







