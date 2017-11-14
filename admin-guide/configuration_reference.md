# Configuration reference

All configurable aspects of the IAM are configured via environment variables and Spring profile directives.

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

## Basic service configuration 

{% include "conf/service_opts.md" %}

## Organization configuration

{% include "conf/org_opts.md" %}

## Database configuration

{% include "conf/db_opts.md" %}

## Google authentication settings

{% include "conf/google_opts.md" %}

For more information and examples, see the [Enabling Google
Authentication section](google.md).

## SAML authentication settings

{% include "conf/saml_opts.md" %}

For more information and examples, see the [Enabling SAML Authentication
section](saml.md).

## Notification service settings

{% include "conf/notification_opts.md" %}

## Account linking settings

{% include "conf/account_linking_opts.md" %}
