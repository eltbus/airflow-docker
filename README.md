# DON'T YOU DARE...
...use this in production. Passwords might be hardcoded in various places. This is just to play around locally.

# REQUIREMENTS
Create an `.env` file and populate it with credentials. For example:
```
POSTGRES_USER="airflow"
POSTGRES_PASSWORD="airflow"
POSTGRES_DB="airflow"
```

*NOTE*: As of May 2024 the `postgres` requires the `linux/amd64` image version, which is now specified in the docker compose.
You can also add the following env var to the `.env` file, but **it will affect all other images and may lead to poor performance**.
```
DOCKER_DEFAULT_PLATFORM=linux/amd64
```

# Airflow users
Once deployed, it is necessary to create users. To do so `exec` into the webserver container with bash and create the user using the Airflow CLI

```bash
docker exec -it "$$(docker ps --format '{{.Names}}' | grep airflow-docker-webserver)" bash
```
And, in the container:
```
airflow users create \
    --username admin \
    --password admin \
    --firstname Peter \
    --lastname Parker \
    --role Admin \
    --email spiderman@superhero.org
```
