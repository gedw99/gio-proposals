# identity

Looking to see if Vault can do what we need.


Auth / Login that uses Vault ?
- Email, oAuth2, OIDC based, so that people can pick what they want, and that their password managers work with it.


Groups, Users, Permissions managed by Vault ?

- and can have the UUIDS modelled agains the data i the DB.

- Is their Web GUi enough to do these things with ?

Test harness

- Then see if we can use this in a simple test cli

Remote Config

- Can we use this for remote config also ? Would be very useful for testing and production, cause you can just change all config in Vault and boot the binary anywhere.

- Teller seems to do that by injecting config into a golang binary at runtime: https://github.com/SpectralOps/teller/issues/27
  - It can use many different providers too, so with dotenv you can use your fiel system, but with the remote providers too. Nice.
  - It also has a github action for using it in ci: https://github.com/SpectralOps/teller#using-a-github-action
  - It also can fuse configs, which is EXACTLY the problem we faced with Amplify. So you can have some standard configs that configs reuse.



Vault GUI.
https://github.com/adobe/cryptr
- forget it its too old and dos not work.

https://github.com/hashicorp/vault-guides
- has great stuff

https://github.com/martinbaillie/vault-plugin-secrets-github
- looks powerful and well supported for CI.

awesome vault
- https://github.com/gites/awesome-vault-tools

