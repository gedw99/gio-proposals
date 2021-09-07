# identity

Reusable for projects is the key here as way too much reinventing the wheel IMHO.


## UserKit

UserKit for user authentication. 
This is a clsoed source system, but shows what we are trying to do.
https://github.com/workpail/userkit-go
Example: https://github.com/mtlynch/whatgotdone#user-authentication

For user signup, user login, and password reset
On the frontend, it loads the UserKit UI widgets. 
On the backend, the auth package is responsible for translating UserKit auth tokens into the developers usernames.

Providence:

https://github.com/AletheiaWareLLC/authgo
- very clean..
- only usename and password

https://github.com/authelia/authelia
- multi factor
- follows the informal "forward auth spec" at: https://doc.traefik.io/traefik/v2.0/middlewares/forwardauth/
  - caddy plugin: https://github.com/authelia/caddy-forwardauth
  - oher: https://github.com/mesosphere/traefik-forward-auth
- gui is react:
  - See: https://github.com/authelia/authelia/blob/master/web/README.md
- db: modernc.org/sqlite
  - See: https://github.com/authelia/authelia/blob/master/internal/storage/sqlite_provider.go#L7
- Webauth: github.com/duosecurity/duo_api_golang
- tools
  - https://github.com/authelia/oidc-tester-app
  - https://github.com/authelia/webauthn


## Vault

Looking to see if Vault can do what we need.

## Config

For Config management server with https://github.com/SpectralOps/teller it works great.

See the teller tooling in gio-tools/config for the client that works with Vault.

## Auth and Authz

Auth / Login that uses Vault ?
- Email, oAuth2, OIDC based, so that people can pick what they want, and that their password managers work with it.


Groups, Users, Permissions managed by Vault ?

- and can have the UUIDS modelled agains the data i the DB.

- Is their Web GUi enough to do these things with ?

Test harness

- Then see if we can use this in a simple test cli

## GUI

Need a WebView that loads a simple Golang based Server and GUI that provides the standard Identity functions of: signup, sign, in, forgot password, etc etc

- Dont want to do it with GIO, because we want a Webview that is reusable by GIO and everythig else.

- https://github.com/AletheiaWareLLC/authgo looks about right 
  - It defaults to username, password and can call Vault API
  - later can add other auth protocols that Vault supports.

---

https://github.com/hashicorp/vault

STATUS: Just getting single and cluster server going so i can test against it.

- So far it does everything above we need

API: https://www.vaultproject.io/api

Agent: https://www.vaultproject.io/docs/agent
- is what we will run on the Servers. Clients use our wrapped API.

Auth: https://www.vaultproject.io/docs/auth

- oidc / oath: https://www.vaultproject.io/docs/auth/jwt/oidc_providers
- jwt: https://www.vaultproject.io/docs/auth/jwt
- userpass: https://www.vaultproject.io/docs/auth/userpass

Plugin: https://www.vaultproject.io/docs/internals/plugins#plugin-catalog

- it maybe that we make a plugin for our needs
- go module uses: github.com/hashicorp/vault/sdk/plugin


OTP plugin: https://github.com/mclarkkeefe/vault-plugin-auth-usertotp
- drop in replacement for Vaults userpass auth method.
- docs and code look good. Try this via make

---



https://github.com/SpectralOps/teller

STATUS: basic commands not working yet. Still trying to figure out its way...
But so far i like it.

Remote Config using teller and vault.

- In relation to configuration variables there is no difference between a developer locally running stuff and a fleet of servers running stuff

- Teller seems to do that by injecting config into a golang binary at runtime: https://github.com/SpectralOps/teller/issues/27
  - It can use many different providers too, so with dotenv you can use your fiel system, but with the remote providers too. Nice.
  - It also has a github action for using it in ci: https://github.com/SpectralOps/teller#using-a-github-action
  - It also can fuse configs, which is EXACTLY the problem we faced with Amplify. So you can have some standard configs that configs reuse.


https://github.com/hashicorp/vault-guides
- has great stuff

https://github.com/martinbaillie/vault-plugin-secrets-github
- looks powerful and well supported for CI.

awesome vault
- https://github.com/gites/awesome-vault-tools


---

