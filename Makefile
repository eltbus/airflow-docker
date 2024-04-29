run:
	@docker compose up -d

exec-airflow-webserver:
	@docker exec -it "$$(docker ps --format '{{.Names}}' | grep airflow-docker-webserver)" bash || echo "Are you sure this container is running?"

stop:
	@docker compose down
