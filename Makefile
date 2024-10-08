build:
	@docker build . -t my-airflow:latest

run:
	@docker compose up

requirements:
	@poetry update
	@poetry export -o requirements.txt --without-hashes --without-urls
