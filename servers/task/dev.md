# task

Need one for:

- in app ( gio with go routine keeping it running)
- desktop ( single instance of server)
- server ( for remote tasks)

SO then:

- indexeddb for in app.
- genji for desktop and server, where the server just has a NATS system in front and it replciates to all the genji based servers

taks are written as golang code and can be run anywhere.
- in app. just embed them
- in desktop, just embed them, and use the embeded genji.
- for server, just run them in cloudrun.