run:
	@docker compose up --detach

dry-run:
	@docker compose up --dry-run

exec-airflow-webserver:
	@docker exec -it "$$(docker ps --format '{{.Names}}' | grep 'airflow.*webserver')" bash || ""

stop:
	@docker compose down
