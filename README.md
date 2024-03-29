# INDIGO IAM service documentation 

This is the INDIGO IAM service documentation for IAM **{{book.iamVersion}}**.

## What is the INDIGO IAM?

See a [brief introduction][iam-intro] on the INDIGO Identity and Access
Management (IAM) service.

## Release notes

#### Notable changes in IAM {{book.iamVersion}}

This release introduces new core functionality in IAM:

- [Multiple token profiles](admin-guide/multi_profile_support.md) 
- [Basic account lifecycle management](admin-guide/lifecycle.md)
- [Improved registration configurability](admin-guide/registration.md) 
- [Local authentication can be disabled](admin-guide/local_authn.md) to rely
  completely on external identity providers

{% set imageTag = book.iamVersion %}
{% set imageName = "indigoiam/iam-login-service:" + imageTag %}

The docker image tag for this release ({{book.iamVersion}}) is: 

<code>{{imageName}}</code>

For the full list of changes, see the [release notes on Github][release-notes].
## Documentation structure

The INDIGO IAM service documentation is composed of the following guides:

- the [IAM as a service guide][aas-guide], targeted at communities interested
  in requesting IAM as a service from INFN; 

- the [Deployment and administration guide][admin-guide], targeted ad system
  administrators interested in deploying, configuring and monitoring the
  service;

- the [User guide][user-guide], targeted at service users, that explains how to
  use the IAM to authenticate and authorize users, manage user registration,
  etc;

- the [Developer guide][developer-guide], targeted at the IAM service
  developers, that provides insight on how to build, develop and test the
  service.

[iam-intro]: about.md
[aas-guide]: iam-aas/README.md
[admin-guide]: admin-guide/README.md
[user-guide]: user-guide/README.md
[developer-guide]: developer-guide/README.md
[release-notes]: https://github.com/indigo-iam/iam/releases/tag/{{book.iamVersion}}
[oidc-conf]: admin-guide/oidc.md
[package-install]: admin-guide/packages.md
[iam-repo]: https://indigo-iam.github.io/repo
