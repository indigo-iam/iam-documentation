# Upgrade

To upgrade IAM to the latest available version, stop the service:
```console
$ systemctl stop iam-login-service
```

Update the package:
```console
$ yum update -y iam-login-service
```

Restart the service:
```console
$ systemctl start iam-login-service
```
