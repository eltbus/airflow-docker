run:
	@docker compose up --build --detach --pull never

dry-run:
	@docker compose up --build --detach --pull never --dry-run

exec-airflow-webserver:
	@docker exec -it "$$(docker ps --format '{{.Names}}' | grep 'airflow.*webserver')" bash || ""

stop:
	@docker compose down
