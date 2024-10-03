FROM apache/airflow:latest-python3.12
ADD requirements.txt .
RUN --mount=type=cache,target=/root/.cache/pip \
	--mount=type=bind,source=requirements.txt,target=requirements.txt \
	pip install apache-airflow==${AIRFLOW_VERSION} -r requirements.txt
ADD ./config /opt/airflow/
