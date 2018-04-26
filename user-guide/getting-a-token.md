# CLI support: obtaining an IAM access token 

A token can be obtained from a command-line interface (CLI) in two ways:

- leveraging the OAuth resource-owner password credentials flow (password flow,
  in short)
- leveraging the OAuth device code flow

## Obtaining a token with the password flow

The [password flow][oauth-password-flow] allows a user to get a token from the
IAM by using the IAM local credentials (i.e. the username/password credentials
setup at IAM registration time).

In order to use the password flow, a non-privileged user has to:

1. register a client following the instructions given in [the client
  registration][client-registration] section
2. Note down the `client_id` of the generated client and ask an IAM
   administrator to enable the password flow for such client
3. Wait until the client as the password flow enabled
4. Use a script similar to the one given [here][get-token-script] (or write
   your own following the recommendations of the [RFC][oauth-password-flow]) to
   obtain a token out of the IAM

While this approach is viable, it is __deprecated__ since:

- it forces the user to request the activation of the password flow for the
  client (it is disabled by default for dynamically registered clients)
- it forces the user to authenticate with the local IAM credentials (external
  authentication mechanisms such as Google or SAML cannot be used)
- it exposes the user credentials to the client application

The device code flow, described in the next section, does not have these
limitations and should be preferred over the password flow.

## Obtaining a token with the device code flow

The [device code flow][oauth-device-code-flow] allows a user to get a token
from the IAM from a CLI interface while using an external browser for the
authentication step. This is convenient since:

- it does not require any authorization from administrators (the device code
  flow can be requested by the user at client registration time)
- it allows the user to authenticate with any of the authentication mechanisms
  supported by the IAM
- it __does not__ expose the user credentials to the client application

For nitty and gritty details on how the flow works, see the
[RFC][oauth-device-code-flow].

After having registered a client with the device flow enabled (see [client
registration section](client-registration.md)), the device code flow can be
used to obtain a token using a script like the one [here][dc-get-token-script]
which does the following:

- contacts the device flow endpoint to start a device flow authentication and
  authorization
- prints code information on the terminal
- waits for user input to proceed and obtain the token(s)

[oauth-password-flow]: https://tools.ietf.org/html/rfc6749#section-4.3
[oauth-device-code-flow]: https://tools.ietf.org/html/draft-ietf-oauth-device-flow-09
[get-token-script]: https://gist.github.com/andreaceccanti/7d863db5ce3f43c74123a2cea8b8f9ff
[dc-get-token-script]: https://gist.github.com/andreaceccanti/5b69323b89ce08321e7b5236de503600
