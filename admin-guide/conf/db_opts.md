
```bash
# The host where the MariaDB/MySQL daemon is running
IAM_DB_HOST=

# The database port
IAM_DB_PORT=3306

# The database name
IAM_DB_NAME=iam

# The database username
IAM_DB_USERNAME=iam

# The database password 
IAM_DB_PASSWORD=pwd

## Database connection pool options

# Maximum number of active connections to the database
IAM_DB_MAX_ACTIVE=50

# Maximum number of idle connections in the pool 
IAM_DB_MAX_IDLE=5

# Initial size of the database connection pool
IAM_DB_INITIAL_SIZE=8

# Should idle connections in the pool be tested?
IAM_DB_TEST_WHILE_IDLE=true

# Should connections in the pool be tested when borrowed?
IAM_DB_TEST_ON_BORROW=true

# Which SQL query should be used to test connections?
IAM_DB_VALIDATION_QUERY=SELECT 1

# Time between database connection pool eviction runs (in msec)
IAM_DB_TIME_BETWEEN_EVICTION_RUNS_MILLIS=5000

# The minimum amount of time a connection may be idle in the pool
# before it is considered for eviction (in msec)
IAM_DB_MIN_EVICTABLE_IDLE_TIME_MILLIS=60000
```
