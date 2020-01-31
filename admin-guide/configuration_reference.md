# Configuration reference

Most configurable aspects of the IAM are configured via environment variables
and Spring profile directives.


## IAM Spring profiles

Spring profiles are used to enable/disable group of IAM functionalities.
Currently the following profiles are defined:

| Profile name   | Active by default   | Description                                                       |
| -------------- | ------------------- | -------------                                                     |
| prod           | no                  | This is the profile you should enable when using IAM              |
| h2-test        | yes                 | Enables h2 in-memory database, useful for development and testing |
| mysql-test     | no                  | Like h2-test, but used to develop against a MySQL database        |
| google         | no                  | Enables Google authentication                                     |
| saml           | no                  | Enables SAML authentication                                       |
| registration   | yes                 | Enables user registration and reset password functionalities      |

Profiles are enabled by setting the `spring.profiles.active` Java system
property when starting the IAM service. This can be done, using the official
IAM docker image, by setting the IAM_JAVA_OPTS environment variable as follows:

```bash
IAM_JAVA_OPTS="-Dspring.profiles.active=prod,google,saml"
```

## Overriding default configuration templates

Fine-grained control over configuration can be obtained following the rules for
spring boot [externalized configuration][spring-boot-conf-rules].
This basically means defining an YAML file to override the default
configuration files embedded for the Spring profile activated for your
instance.  The configuration directory depends on your deployment type, as
summarized in the following table:

| Deployment type | Configuration directory |
|-----------------|-------------------------|
| Docker | `/indigo-iam/config/` |
| Package (RPM, Deb) | `/etc/indigo-iam/config` |

**IMPORTANT**: the templated configuration should solve most use cases,
override default configuration **only if you know what you are doing**, and for
those scenarios not served by the default templates. 

## Basic service configuration 

{% include "conf/service_opts.md" %}

## Access token contents configuration 

{% include "conf/access_token_opts.md" %}

## Organization configuration

{% include "conf/org_opts.md" %}

## Database configuration

{% include "conf/db_opts.md" %}

## Google authentication settings

{% include "conf/google_opts.md" %}

For more information and examples, see the [Enabling OpenID Connect
Authentication section](oidc.md).

## SAML authentication settings

{% include "conf/saml_opts.md" %}

For more information and examples, see the [Enabling SAML Authentication
section](saml.md).

## Notification service settings

{% include "conf/notification_opts.md" %}

## Account linking settings

{% include "conf/account_linking_opts.md" %}

## Privacy policy settings

{% include "conf/privacy_policy_opts.md" %}


[spring-boot-conf-rules]: https://docs.spring.io/spring-boot/docs/1.3.8.RELEASE/reference/html/boot-features-external-config.html
