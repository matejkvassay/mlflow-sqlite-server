FROM python:3.8-slim-buster
ENV MLFLOW_DB=/data/mlflow.db
ENV PORT=5000
RUN pip install --upgrade pip && pip install mlflow
ENTRYPOINT ["/bin/bash", "-c", "mlflow server -h 0.0.0.0 -p $PORT \
--backend-store-uri $MLFLOW_DB_PATH_FULL --default-artifact-root sqlite:///$MLFLOW_DB"]