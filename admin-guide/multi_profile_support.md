# Support for JWT profiles

Starting with version 1.6.0, IAM introduces support for JWT _profiles_.

A JWT profile is a named set of rules that defines which information is
included in access tokens, id tokens,  userinfo and introspection responses
issued by IAM in an OAuth/OIDC message exchanges.

IAM allows to define a default profile that is used for all clients that are
not explicitly bound to one. This allows to use the same profile across
all clients in an organization.

It's also possible to define the profile to be used at client level, using
scopes, i.e. adding among the scope allowed for the client the name of the
profile the client should use. The scope, in this context, does not identify a
set of permissions but an encoding of authentication/authorization informations
in tokens and responses issued by IAM.

This mechanism enables integration of the same IAM instance with resources
relying on different profiles.

IAM currently supports three JWT profiles:

- the `iam` profile
- the `wlcg` WLCG profile 
- the `aarc` profile


## Setting the default profile

The IAM JWT default profile is set using the `IAM_JWT_DEFAULT_PROFILE`
environment variable, e.g.:

```
IAM_JWT_DEFAULT_PROFILE=iam
```

The default profile will be used for all clients that do not explicitly and
correctly request the use of a profile using scopes. 

## Using scopes to select the JWT profile for a client

To select the profile used by a client, include one of the following scopes
in the list of scopes authorized for a client:

- `iam`, for the IAM profile
- `wlcg`, for the WLCG profile 
- `aarc` profile, for the AARC profile

Clients should only link to one profile. When multiple profiles are linked to a
client, IAM falls back to the default profile configured for the IAM instance.


## Using system scopes to control profile selection

MitreID **System Scopes** can be used to control access to profile selection.

For example, by setting a profile scope as `restricted`, such scope will not be
available to dynamically registered clients and can only be assigned to clients
by IAM administrators.

## Supported JWT profiles

### The IAM profile

This is the default profile for IAM.

With this profile:

- groups are enconded in the `groups` claim; all the groups the user is member
  of are included in the groups claim;

- authentication information (username, email, groups) is not by default
  included in access tokens; this behaviour can be changed by setting the
  `IAM_ACCESS_TOKEN_INCLUDE_AUTHN_INFO=true` environment variable;

- scope information is not by default included in access tokens; this behaviour
  can be changed by setting the `IAM_ACCESS_TOKEN_INCLUDE_SCOPE=true`
  environment variable;

- the `nbf` (not before) claim is not set in access tokens; this behaviour
  can be changed by setting the `IAM_ACCESS_TOKEN_INCLUDE_NBF=true`
  environment variable;

This profile is assigned to clients using the `iam`  scope.

### The WLCG profile

This profile implements the [Common JWT Token profile][wlcg-profile].

In particular:

- the `scope` claim is always included in access tokens;
- groups are not included by default in access and ID tokens; 

This profile is assigned to clients using the `wlcg` scope.

#### Requesting groups with the WLCG profile

When the WLCG profile is used, groups are not automatically included in access
tokens and ID tokens, but can be requested using the `wlcg.groups` scope,
following the rules described in the [WLCG
profile](https://github.com/WLCG-AuthZ-WG/CommonJWTProfile/blob/master/profile.md#scope-based-group-selection).

#### Optional groups

Optional groups are groups whose membership is only asserted in tokens on
explicit request coming from a user.

In order to configure a IAM group as an optional group, add the
`wlcg.optional-group` label to the group.


### The AARC profile

This profile encodes group membership information following the rules defined
by the [AARC G002][aarc-g002] profile document.

This profile is assigned to clients using the `aarc` scope.

**TODO (EV) **: describe profile in more detail.

[wlcg-profile]: https://zenodo.org/record/3460258
[aarc-g002]: https://aarc-project.eu/guidelines/aarc-g002/
