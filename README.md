# GOAL
Use it to to play around locally.

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

# HOW TO
Use the `Makefile`:

- Edit the configuration files in `/config` to match your needs.
- Use `make build` to build your airflow image with your configuration.
- Use `make run` spin up all the services.

## Airflow users
Once deployed, it is necessary to create at least one user to be able to log in.

```bash
docker exec -it "$$(docker ps --format '{{.Names}}' | grep webserver)" bash
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

# KNOWN ISSUES
## WSL2
My setup in WSL2 complains about permissions a lot. Had to do the following to fix permissions:
`sudo chown -hR $(whoami) dags/`
