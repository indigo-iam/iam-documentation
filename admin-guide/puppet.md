# Automated provisioning with Puppet

The IAM login service Puppet module can be  found [here][puppet-iam-repo].

The module configures the IAM Login Service packages installation,
configuration and the automatic generation of the JWK keystore.

The setup of the MySQL database used by the service as well as the setup of the
reverse proxy are **not covered** by this module.

However, the module provides an example of setup of both the Login Service and
NginX as reverse proxy, using the official NginX Puppet module.

For more detailed information about the Indigo IAM Puppet module usage, see the
documentation in the [Github repository][puppet-iam-repo].


[puppet-iam-repo]: https://github.com/indigo-iam/puppet-indigo-iam
