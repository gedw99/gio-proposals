# identity

Looking to see if Vault can do what we need.


Auth / Login that uses Vault ?
- Email, oAuth2, OIDC based, so that people can pick what they want, and that their password managers work with it.


Groups, Users, Permissions managed by Vault ?

- and can have the UUIDS modelled agains the data i the DB.

- Is their Web GUi enough to do these things with ?

Test harness

- Then see if we can use this in a simple test cli

GIO

- Golang GUI that is a standard Idendity Model for sgnuo, sign, in, forgot password, etc etc
- Dont want to do it with GIO, because we want a Webview that is reusable by GIO and everythig else.

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

