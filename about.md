# The INDIGO Identity and Access Management service 

The INDIGO Identity and Access Management Service provides a layer where
identities, enrollment, group membership and other attributes and authorization
policies on distributed resources can be managed in an homogeneous way,
supporting identity federations and other authentication mechanisms (X.509
certificates and social logins).

The IAM service has been succesfully integrated with many off-the-shelf
components like Openstack, Kubernetes, Atlassian JIRA and Confluence, Grafana
and with key Grid computing middleware services (FTS, dCache, StoRM).

## Functions

* **Authentication**: The IAM supports authentication via SAML IdPs or identity
  federations, OpenID Connect providers and X.509 certificates.
* **Enrollment**: The IAM provides enrollment and registration functionalities,
  so that users can join groups/collaborations according to well-defined flows.
* **Attribute and identity management**: The IAM provides services to manage
  group membership, attributes assignment and account linking functionality.
* **User provisioning**: the IAM provides endpoints to provision information
  about users identities to other services, so that consistent local account
  provisioning, for example, can be implemented.

## Service access options

### IAM as a service 

INFN provides IAM as a service to partner research communities. In this
scenario, a dedicated IAM instance is deployed on the INFN infrastructure and
configured according to the community needs. INFN takes care of keeping the
service operational and up-to-date, while administrative control on the IAM
instance is granted to the community. 

For more information on how to access IAM as a service, click
[here][iam-as-a-service].

### On-premise deployment 

IAM is an Apache-licensed identity solution, for which we provide a Docker
image on dockerhub and RPM and Debian packages.

IAM can be deployed on-premises following the advice in the [Deployment and
administration guide][deployment-guide].

## Involved Software & Specifications

### Specifications

* [OpenID connect](http://openid.net/connect/)
* [OAuth 2.0](http://tools.ietf.org/html/rfc6749)
* [SCIM](http://www.simplecloud.info/)
* [SAML](https://www.oasis-open.org/committees/security/)
* [XACML](https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=xacml)

### Software

* [Mitreid-connect](https://github.com/mitreid-connect/)
* [Argus authorization service](http://argus-authz.github.io/)

[iam-as-a-service]: iam-aas/README.md
[deployment-guide]: admin-guide/README.md
