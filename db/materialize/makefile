print:

dep:
	# Server
	# https://materialize.com/docs/install/
	brew install MaterializeInc/materialize/materialized
	materialized -v
	which materialized

dep-cli:
	# CLI
	# https://github.com/MaterializeInc/mzcli#quick-start
	brew install pipx
	pipx ensurepath
	pipx install mzcli
	pipx ensurepath
	which mzcli

dep-db:
	# db
	brew install postgresql

### Server

mat-server-run:
	# Mat is a Postresql server that incorporates Materialise. Its the main things you connct to..
	# -w 1 specifies that the process will use 1 worker
	# By default uses Database: materialize; Port: 6875
	materialized -w 1
	# http://0.0.0.0:6875/

### CLI

# See https://materialize.com/docs/connect/cli/
mat-cli-run:
	mzcli -h 0.0.0.0 -p 6875 -u materialize

psql-cli-run:	
	# works
	psql -U materialize -h 0.0.0.0 -p 6875 materialize
psql-cli-run-1:
	# works
	psql postgres://materialize@0.0.0.0:6875/materialize



