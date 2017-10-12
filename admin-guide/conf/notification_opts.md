```bash
## SMTP mail server settings 

# SMTP server hostname 
IAM_MAIL_HOST=localhost

# SMTP server port 
IAM_MAIL_PORT=25

# SMTP server username
IAM_MAIL_USERNAME=

# SMTP server password
IAM_MAIL_PASSWORD=

## IAM notification settings

# Should the notification server be disabled?
# When set to true, notifications are not sent to the mail server (but
# printed to the logs)
IAM_NOTIFICATION_DISABLE=false

# The email address used as the sender in IAM email notifications
IAM_NOTIFICATION_FROM=indigo@localhost

# The email address used as the recipient in IAM email notifications
IAM_NOTIFICATION_ADMIN_ADDRESS=indigo-alerts@localhost

# Time interval, in milliseconds, between two consecutive runs of IAM notification 
# dispatch task 
IAM_NOTIFICATION_TASK_DELAY=30000

# Retention of delivered messages, in days
IAM_NOTIFICATION_CLEANUP_AGE=30
```
