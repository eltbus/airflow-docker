import datetime

from airflow import DAG
from airflow.models.baseoperator import BaseOperator
from airflow.operators.bash import BashOperator
from airflow.operators.empty import EmptyOperator


class HelloOperator(BaseOperator):
    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)

    def execute(self, context):
        message = f"Hi"
        return message


with DAG(
    dag_id="example",
    start_date=datetime.datetime(2021, 1, 1),
    schedule=None,
):
    start = EmptyOperator(task_id="start")

    bash_hello = BashOperator(task_id="bash_hello", bash_command="echo 'Hello!'")

    custom_hello = HelloOperator(task_id="custom_hello")

    end = EmptyOperator(task_id="end")

    start >> [bash_hello, custom_hello] >> end # type:ignore
