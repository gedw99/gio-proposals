# makefiles

These makefile includes follow certain conventions to:

- Ensure CI and Local Dev work the same.
- Provide conventions that are extensible.

## Examples

[examples/gioui__gio-example](examples/gioui__gio-example) is an example project to try.

## Conventions

There are some conventions in all this that you can follow to stay out of trouble.

### Naming of targets 

Use a Prefix to isolate each make target of each makefile respectively.

For example:

In [go.mk](go.mk), you have ```go-build```, ```go-run```, etc

in [git.mk](git.mk) you have ```git-repo-clone-origin```, ```git-repo-clone-upstream```, etc


### prefix-print ###

Each makefile include has a ```<prefix>-print``` to help you understand what variables it expects from you.

It will echo them back to you.

During CI, it will audit trail the builds.

During local dev, it helps with configuring the variables corretcly in your root makefile.

For example:

In [go.mk](go.mk), you have the following variables:
- ```GO_OS```
- ```GO_EX```
- ```GO_BIN_FSPATH```
- ```GO_BIN_NAME```


In [gio.mk](gio.mk), you have the following variables:
- ```GIO_EX_PATH```
- ```GIO_EX_NAME```

### prefix-dep ###

Each make file includes has a ```<prefix>-dep``` that ensures any dependendy it has are installed.

This ensures both CI and Local Dev always have the dependencies and they are the same in each environment.

For example in [gio.mk](gio.mk), it will ensure that the gogio compile tools is installed. The version can be reflected from the go.modules per project.


