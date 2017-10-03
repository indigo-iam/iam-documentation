# Configuration reference

## IAM profiles

IAM profiles are used to enable/disable group of IAM functionalities. Currently the
following profiles are defined:

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

## Service configuration 

| Env. variable                  | Default value                   | Meaning                                                                                                     |
| ---                            | ---                             | ---                                                                                                         |
| IAM_HOST                       | localhost                       | The IAM service will bind on this host                                                                      |
| IAM_PORT                       | 8080                            | The IAM service will listen on this port                                                                    |
| IAM_USE_FORWARDED_HEADERS      | false                           | Use forward headers from reverse proxy. Set this to true when deploying the service behind a reverse proxy. |
| IAM_KEY_STORE_LOCATION         | N/A                             | The path to the JSON key store that holds the keys used to sign the tokens                                  |
| IAM_X509_TRUST_ANCHORS_DIR     | /etc/grid-security/certificates | Where CA certificates will be searched                                                                      |
| IAM_X509_TRUST_ANCHORS_REFRESH | 14400                           | How frequently (in seconds) should trust anchors be refreshed                                               |

## Organization configuration

| Env. variable           | Default value                           | Meaning                                                                       |
| ----------------------- | -----------------------                 | ---------                                                                     |
| IAM_ORGANIZATION_NAME   | indigo-dc                               | This is the name of the organization managed by this IAM instance.            |
| IAM_LOGO_URL            | resources/images/indigo-logo.png        | URL of logo image used in the IAM dashboard                                   |
| IAM_TOPBAR_TITLE        | INDIGO IAM for ${iam.organisation.name} | String displayed into the top bar of the browser when using the IAM dashboard |


## Database access configuration

| Env. variable   | Default value | Meaning                                            |
| --------------  | ------------- | -------                                            |
| IAM_DB_HOST     | N/A           | The host where the MariaDB/MySQL daemon is running |
| IAM_DB_PORT     | 3306          | The database port                                  |
| IAM_DB_NAME     | iam           | The database name                                  |
| IAM_DB_USERNAME | iam           | The database username                              |
| IAM_DB_PASSWORD | pwd           | The database password                              |

#### Google authentication options

| Env. variable            | Default value | Meaning                                 |
| --------------           | ------------- | -------                                 |
| IAM_GOOGLE_CLIENT_ID     | N/A           | The google OpenID-connect client id     |
| IAM_GOOGLE_CLIENT_SECRET | N/A           | The Google OpenID-connect client secret |

For more information and examples, see the [Enabling Google
Authentication section](google.md).

#### SAML authentication options

| Env. variable              | Default value | Meaning                                                                   |
| --------------             | ------------- | -------                                                                   |
| IAM_SAML_ENTITY_ID         | N/A           | The SAML entity ID                                                        |
| IAM_SAML_KEYSTORE          | N/A           | The keystore holding SAML certificate and keys                            |
| IAM_SAML_KEYSTORE_PASSWORD | N/A           | The keystore password                                                     |
| IAM_SAML_KEY_ID            | N/A           | The identifier of the key that should be used to sign requests/assertions |
| IAM_SAML_KEY_PASSWORD      | N/A           | The SAML key password                                                     |
| IAM_SAML_IDP_METADATA      | N/A           | The path to the SAML federation idp metadata                              |

For more information and examples, see the [Enabling SAML Authentication
section](saml.md).

#### Notification service options

| Env. variable                  | Default value           | Meaning                                                                                                                    |
| -----------------              | ---------------         | ---------                                                                                                                  |
| IAM_MAIL_HOST                  | localhost               | Hostname of the SMTP server to use for sending notification emails                                                         |
| IAM_MAIL_PORT                  | 25                      | Port on which SMTP server to use is listening                                                                              |
| IAM_MAIL_USERNAME              | N/A                     | Username to use for authentication on SMTP server, if required                                                             |
| IAM_MAIL_PASSWORD              | N/A                     | Password to use for authentication on SMTP server, if required                                                             |
| IAM_NOTIFICATION_DISABLE       | false                   | Turn on the notification service. If set to `true`, notifications aren't send to mail server, but logged into the log file |
| IAM_NOTIFICATION_FROM          | indigo@localhost        | Mail address used as mail sender                                                                                           |
| IAM_NOTIFICATION_TASK_DELAY    | 30000                   | Time interval, in milliseconds, between two consecutive runs of the job that send notifications                            |
| IAM_NOTIFICATION_CLEANUP_AGE   | 30                      | Retention of delivered messages, in days                                                                                   |
| IAM_NOTIFICATION_ADMIN_ADDRESS | indigo-alerts@localhost | Mail address used as receiver for administrative notifications                                                             |
