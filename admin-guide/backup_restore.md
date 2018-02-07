# Backup and restore

## Backup

The IAM Login Service status data keep safe are:
 - database data;
 - the enviroment file `/etc/sysconfig/iam-login-service`;
 - the main keystore (default `/var/lib/indigo/iam-login-service/keystore.jks`);
 - SAML keystore, if SAML profile is used (default `/var/lib/indigo/iam/iam-login-service/example.ks`).

An example of backup script can be the following:

```bash
timestamp=`date +'%Y-%m-%d_%H%M%S'`

MYSQL_HOST="mydbhost"
MYSQL_USER="iamloginserviceuser"
MYSQL_PWD="iamloginservicepassword"
MYSQL_DBNAME="iamloginservicedb"

MYSQL_DUMP_OPTS="-u ${MYSQL_USER} -p${MYSQL_PWD} --host ${MYSQL_HOST}"

dumpfile=iam_dump.sql

mysqldump ${MYSQL_DUMP_OPTS} ${MYSQL_DBNAME} > ${dumpfile}

tar czf iam_backup.tar.gz \
  ${dumpfile} \
  /etc/sysconfig/iam-login-service \
  /var/lib/indigo/iam-login-service/keystore.jks \
  /var/lib/indigo/iam/iam-login-service/example.ks
```

The keystore paths can be customized, so adapt the backup script according your configuration.

## Restore

To restore IAM Login Service from scratch, install the package:
```console
$ yum install -y iam-login-service
```

From the backup, import the database data from the SQL dump:
```console
$ export MYSQL_HOST="mydbhost"
$ export MYSQL_USER="iamloginserviceuser"
$ export MYSQL_PWD="iamloginservicepassword"
$ export MYSQL_DBNAME="iamloginservicedb"

$ mysql --host ${MYSQL_HOST} -u ${MYSQL_USER} -p${MYSQL_PWD} ${MYSQL_DBNAME} < iam_backup/iam_dump.sql
```

Restore the environment file:
```console
$ cp iam_backup/etc/sysconfig/iam-login-service /etc/sysconfig/iam-login-service
```

Copy the keystores in the correct path, according your configuration:
```console
$ cp iam_backup/var/lib/indigo/iam-login-service/keystore.jks /var/lib/indigo/iam-login-service/keystore.jks
$ cp iam_backup/var/lib/indigo/iam/iam-login-service/example.ks /var/lib/indigo/iam/iam-login-service/example.ks
```

Ensure the keystores have the right owner:
```console
$ chown -R iam:iam /var/lib/indigo/iam-login-service
```

Start the IAM Login Service daemon:
```console
$ systemctl start iam-login-service
```
