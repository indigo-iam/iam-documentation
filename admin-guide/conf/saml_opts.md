```bash
# The SAML entity ID for this IAM instance
IAM_SAML_ENTITY_ID=

# Text shown in the SAML login button on the IAM login page
IAM_SAML_LOGIN_BUTTON_TEXT=Sign in with SAML

## SAML keystore settings

# The keystore holding certificates and keys used for SAML crypto
IAM_SAML_KEYSTORE= 

# The SAML keystore password
IAM_SAML_KEYSTORE_PASSWORD=

# The identifier of the key that should be used to sign requests/assertions
IAM_SAML_KEY_ID=

# The password of the SAML key that will be used to sign requests/assertions
IAM_SAML_KEY_PASSWORD=

## Metadata settings

# a URL pointing to the SAML federation or IdP metadata
IAM_SAML_IDP_METADATA=

# Metadata refresh period (in seconds)
IAM_SAML_METADATA_LOOKUP_SERVICE_REFRESH_PERIOD_SEC=600

# Should signature validity checks be enforced on metadata?
IAM_SAML_METADATA_REQUIRE_VALID_SIGNATURE=false

# Trust only IdPs that have SIRTFI compliance
IAM_SAML_METADATA_REQUIRE_SIRTFI=false

# Comma-separated IDP entity ID whitelist. When empty
# all IdPs included in the metadata are whitelisted
IAM_SAML_IDP_ENTITY_ID_WHITELIST=

## Assertion validity settings

# Maxixum allowed assertion time (in seconds)
IAM_SAML_MAX_ASSERTION_TIME=3000

# Maximum authentication age (in seconds)
IAM_SAML_MAX_AUTHENTICATION_AGE=86400

## Other settings

# List of attribute aliases that are looked up in assertion to identify the 
# user authenticated with SAML
IAM_SAML_ID_RESOLVERS=eduPersonUniqueId,eduPersonTargetedId,eduPersonPrincipalName
```
