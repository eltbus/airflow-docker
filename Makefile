build:
	@docker build . -t my-airflow:latest

run: build
	@docker compose up --build

exec-airflow-webserver:
	@docker exec -it "$$(docker ps --format '{{.Names}}' | grep 'airflow.*webserver')" bash || ""

requirements:
	@poetry update
	@poetry export -o requirements.txt --without-hashes --without-urls
