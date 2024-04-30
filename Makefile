build:
	@docker build . -t my-airflow:latest

run: build
	@docker compose up --build --detach

dry-run:
	@docker compose up --build --dry-run

exec-airflow-webserver:
	@docker exec -it "$$(docker ps --format '{{.Names}}' | grep 'airflow.*webserver')" bash || ""

stop:
	@docker compose down
