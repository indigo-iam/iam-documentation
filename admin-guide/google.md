# Enabling Google authentication

IAM supports authentication with Google. When Google authentication is turned
on for an IAM instance, users can log into the service using their Google
credentials.

To enable Google Authentication for your IAM instance you have to:

- Obtain Google OAuth client credentials from Google; see the [Google identity
  platform OpenID Connect guide][google-oidc] for help on this;
- Enable the `google` profile for the IAM;
- Pass the google client credentials to the IAM via the following environment
  variables:

  - `IAM_GOOGLE_CLIENT_ID` 
  - `IAM_GOOGLE_CLIENT_SECRET`

When Google authentication is enabled, a __Sign in with Google__ button is
shown on the IAM login page:

![Goole login enabled](images/google-login-enabled.png)

[google-oidc]: https://developers.google.com/identity/protocols/OpenIDConnect



