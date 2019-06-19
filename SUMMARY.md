# Summary

* [The IAM service](about.md)
* [Documentation](README.md)

---
### IAM as a Service
* [IAM as a service](iam-aas/README.md)
    - [Terms of service](iam-aas/terms-of-service.md)
    - [Service level Agreement](iam-aas/sla.md)
    - [Privacy policy](iam-aas/privacy-policy.md)
---


### Deployment and administration guide

* [Overview](admin-guide/README.md)
* [NGINX configuration](admin-guide/nginx.md)
* [Database configuration](admin-guide/mariadb.md)
* [JSON Web Keys generation](admin-guide/json_web_key.md)
* [Deployment with Docker](admin-guide/docker.md)
* [Deployment with packages](admin-guide/packages.md)
* [Automated provisioning with Puppet](admin-guide/puppet.md)
* [Basic IAM setup](admin-guide/basic_conf.md)
* [Enabling Google authentication](admin-guide/google.md)
* [Enabling SAML authentication](admin-guide/saml.md)
* [Configuration reference](admin-guide/configuration_reference.md#configuration-reference)
    - [IAM Spring profiles](admin-guide/configuration_reference.md#iam-spring-profiles)
    - [Basic service configuration](admin-guide/configuration_reference.md#basic-service-configuration)
    - [Database configuration](admin-guide/configuration_reference.md#database-configuration)
    - [Google authentication settings](admin-guide/configuration_reference.md#google-authentication-settings)
    - [SAML authentication settings](admin-guide/configuration_reference.md#saml-authentication-settings)
    - [Notification service settings](admin-guide/configuration_reference.md#notification-service-settings)
    - [Account linking settings](admin-guide/configuration_reference.md#account-linking-settings)
    - [Privacy policy settings](admin-guide/configuration_reference.md#privacy-policy-settings)
* [Audit log](admin-guide/audit_log.md)
* [Health checks](admin-guide/health_endpoints.md)
* [Backup and restore](admin-guide/backup_restore.md)
* [Upgrade](admin-guide/upgrade.md)
---

### User guide
* [Overview](user-guide/README.md)
* [Client registration](user-guide/client-registration.md)
* [How to obtain a token](user-guide/getting-a-token.md)
* User Dashboard functionality
    * [Changing the account password](user-guide/changing-password.md)
    * [Changing the account information](user-guide/change-details.md)
    * [Managing active tokens](user-guide/manage-active-tokens.md)
    * [Managing approved sites](user-guide/manage-approved-sites.md)
    * [External account linking](user-guide/account-linking/ext.md)
    * [X.509 certificate linking](user-guide/account-linking/x509.md)
* [Registration Service](user-guide/registration-service/README.md)
    * [Submit a request](user-guide/registration-service/submit-request.md)
    * [Confirm a request](user-guide/registration-service/confirm-request.md)
    * [Manage registration requests](user-guide/registration-service/manage-request.md)
    * [Set account password](user-guide/registration-service/choosing-password.md)
    * [Reset account password](user-guide/registration-service/resetting-password.md)
* [AUP management](user-guide/aup/README.md)
* [User management](user-guide/user-management.md)
    * [Create account](user-guide/user-management.md#creating-a-user-account)
    * [Delete account](user-guide/user-management.md#deleting-a-user-account)
    * [Disable account](user-guide/user-management.md#disabling-a-user-account)
    * [Manage account privileges](user-guide/user-management.md#managing-user-account-privileges)
    * [Manage account external identities](user-guide/user-management.md#managing-external-user-account-identities)
* [Group Management](user-guide/groups_management.md)
    * [Group creation](user-guide/groups_management.md#creating-a-group)
    * [Group deletion](user-guide/groups_management.md#deleting-a-group)
    * [Group membership management](user-guide/groups_management.md#managing-membership-for-a-group)
* [IAM APIs](user-guide/api/README.md)
    * [OAuth Token exchange API](user-guide/api/oauth-token-exchange.md)
    * [SCIM API](user-guide/api/scim-api.md)
    * [Token management API](user-guide/api/tokens-api.md)
    * [OpenID Connect client registration APIs](user-guide/api/oidc-client-registration.md)
    * [OpenID Connect client management API](user-guide/api/oidc-client-management.md)
    * [OAuth token introspection API](user-guide/api/oauth-token-introspection.md)
    * [AUP API](user-guide/api/aup-api.md)
    * [Group membership requests API](user-guide/api/group-requests.md)
---

### Developer guide

* [Overview](developer-guide/README.md)
