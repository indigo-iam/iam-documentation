```bash
# The IAM service will list for requests on this host.
IAM_HOST=localhost

# The IAM service webapp will bind on this port.
IAM_PORT=8080

# The IAM web application base URL
IAM_BASE_URL=http://${IAM_HOST}:8080

# The OpenID Connect issuer configured for this IAM instance.
# This must be equal to IAM_BASE_URL
IAM_ISSUER=http://${IAM_HOST}:8080

# The path to the JSON keystore that holds the keys IAM will use to sign and
# verify token signatures
IAM_KEY_STORE_LOCATION=

# IAM will look for trust anchors in this directory.  These trust anchors are
# needed for TLS operations where the IAM acts as a client (i.e., to
# authenticate to remote SAML Identity providers)
IAM_X509_TRUST_ANCHORS_DIR=/etc/grid-security/certificates

# How frequently (in seconds) should trust anchors be refreshed
IAM_X509_TRUST_ANCHORS_REFRESH=14400

# Use forwarded headers from reverse proxy. Set this to true when deploying the
# service behind a reverse proxy.
IAM_USE_FORWARDED_HEADERS=false

## Tomcat embedded container settings

# Enables the tomcat access log
IAM_TOMCAT_ACCESS_LOG_ENABLED=false

# Directory where the tomcat access log will be written (when enabled)
IAM_TOMCAT_ACCESS_LOG_DIRECTORY=/tmp

## Actuator endpoint settings

# Sets the username of the user allowed to have privileged access to actuator
# endpoints
IAM_SUPERUSER_USERNAME=whatever

# Sets the password of the user allowed to have privileged access to actuator
# endpoints
IAM_SUPERUSER_PASSWORD=whatever


## Local resources configuration

# Enables the serving of resources from the local file system 
IAM_LOCAL_RESOURCES_ENABLE=false

# Sets the directory that contains the local resources that should be exposed
IAM_LOCAL_RESOURCES_LOCATION=file:/indigo-iam/local-resources
```
