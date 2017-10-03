# Enabling SAML authentication

IAM supports SAML authentication. When SAML authentication is turned on for an
IAM instance, users can log into the service using the home IdP credentials.

To enable SAML authentication for your IAM instance you have to:

- Create SAML metadata for your IAM instance; this includes generating a
  self-signed X.509 certificate that will be used for SAML cryptographic
  operations and including it in a Java keystore;
- Choose an entityId for your IAM instance;
- Obtain SAML metadata from your IdP or identity federation; 
- Enable the `saml` profile for the IAM and configure SAML support via the
  appropriate environment variables.

## Self-signed certificate and keystore generation

To generate a self-signed certificate that lasts 5 years use the following
openssl command:

```console
openssl req -newkey rsa:2048 -nodes -x509 -days 1825  -keyout self-signed.key.pem \
  -out self-signed.cert.pem
```

The above command will generate a private key and the corresponding certificate
in PEM format. You will be asked to provide a subject for the certificate being
generated. 

To import this certificate in a Java keystore we need in in p12 format. Use the
following commands to convert the certificate in p12 format and import it in a
Java keystore:

```console
openssl pkcs12 -export -inkey self-signed.key.pem \
    -in self-signed.cert.pem \
    -out self-signed.p12

keytool -importkeystore -destkeystore self-signed.jks \
    -srckeystore self-signed.p12 \
    -srcstoretype PKCS12
```

During the above process you will be asked to provide a p12 export password and
a keystore password. Use the same password, at least 6 characters long,
otherwise it will not work for the java keystore.

You can list the contents of the keystore with the following command:

```console
keytool -list -keystore self-signed.jks

```
## IAM SAML requirements 

IAM requires that the IdP used for authentication releases a persistent
identifier attribute that can be used to link the external identity to local
IAM accounts. If the IdP does not release persistent identifier attributes, it
**cannot** be integrated with the IAM.

The attribute used to link the external SAML account is configurable. In the
default configuration, IAM uses the following attributes (in the given order):

1. [EduPersonUniqueId][epuid]
2. [EduPersonTargetedId][eptid]
3. [EduPersonPrincipalName][eppn]

The order of these can be changed with the `IAM_SAML_ID_RESOLVERS` environment variable.

## Metadata configuration

The IdP or federation metadata to be trusted can be specified with the
`IAM_SAML_IDP_METADATA` environment variable, which contains an URL pointing to
the metadata.

If the metadata is signed, you can enforce signature validation with the
`IAM_SAML_METADATA_REQUIRE_VALID_SIGNATURE` variable.

An example metadata configuration could be:

```env
IAM_SAML_IDP_METADATA=http://www.garr.it/idem-metadata/idem-metadata-sha256.xml
IAM_SAML_METADATA_REQUIRE_VALID_SIGNATURE=true
```

See the [configuration reference][conf-ref] for more SAML metadata options.

[epuid]:http://software.internet2.edu/eduperson/internet2-mace-dir-eduperson-201602.html#eduPersonUniqueId
[eptid]:http://software.internet2.edu/eduperson/internet2-mace-dir-eduperson-201602.html#eduPersonTargetedID
[eppn]: http://software.internet2.edu/eduperson/internet2-mace-dir-eduperson-201602.html#eduPersonPrincipalName
[conf-ref]: configuration_reference.md#saml-authentication-options
