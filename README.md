# DON'T YOU DARE...
...use this in production. Passwords might be hardcoded in various places. This is just to play around locally.

# REQUIREMENTS
Create an `.env` file and populate it with credentials. For example:
```
POSTGRES_USER="airflow"
POSTGRES_PASSWORD="airflow"
POSTGRES_DB="airflow"
```

# Airflow users
Once deployed, it is necessary to create users. To do so `exec` into the webserver container with bash and create the user using the Airflow CLI

```bash
docker exec -it "$$(docker ps --format '{{.Names}}' | grep airflow-docker-webserver)" bash
```
And, in the container:
```
airflow users create --username 'john.smith' --password 'admin' --firstname 'John' --lastname 'Smith' --role 'Admin' --email 'john.smith@foo.bar'
```
