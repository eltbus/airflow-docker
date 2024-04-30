run:
	@docker compose up -d

exec-airflow-webserver:
	@docker exec -it "$$(docker ps --format '{{.Names}}' | grep airflow-docker-webserver)" bash

stop:
	@docker compose down
