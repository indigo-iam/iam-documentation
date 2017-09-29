# IAM Deployment and Administration guide

This is the INDIGO IAM deployment and administration guide.

The IAM Login Service can be deployed in two different ways:

 - as a Docker container; see the [Deployment with docker][docker-deployment]
   section;
 - as systemd daemon installed via RPM or Deb packages; see the [Deployment
   with packages][packages-deployment] section;

A Puppet module is also provided to simplify the installation and configuration
of the service on Ubuntu and CENTOS 7. More information on this can be found in
the [puppet module section][puppet].

[docker-deployment]: docker.md
[packages-deployment]: packages.md
[puppet]: puppet.md
