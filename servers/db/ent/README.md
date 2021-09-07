# ent

Compelling and now part of Linxu foundation ( https://entgo.io/blog/2021/09/01/ent-joins-the-linux-foundation) , is an ORM and Network stack rolled into one.

so state is only moddlled in the Ent schema ( goalng code), and you gen the DB and network fro it.

Using the sqlite driver with litestream for HA and DR is a pretty good mix.

Latest tag : v0.9.1

## Authz

https://entgo.io/docs/privacy/
https://pkg.go.dev/entgo.io/ent/examples/privacyadmin/ent/privacy

Activated withing generation
``` 
Features: []gen.Feature{
			gen.FeaturePrivacy,
			gen.FeatureEntQL,
		},
``` 
Or via cli
``` 
go run entgo.io/ent/cmd/ent generate --feature privacy,entql ./ent/schema

``` 




## Tooling 


Relationships Diagrams
https://github.com/hedwigz/entviz

ERD diagram
https://github.com/a8m/enter



Https Rest networking
https://github.com/masseelch/elk

graphql networking
https://github.com/ent/contrib/tree/master/entgql
- usage requires the entgo.io/contrib/entgql import

proto and grpc networking
https://github.com/ent/contrib/tree/master/entproto

