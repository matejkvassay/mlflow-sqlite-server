FROM python:3.8-slim-buster
ENV MLFLOW_RUNS_DIR=/data
ENV BACKEND_STORE_DB_PATH=$MLFLOW_RUNS_DIR/mlflow.db
ENV BACKEND_STORE_URI=sqlite:///$BACKEND_STORE_DB_PATH
ENV DEFAULT_ARTIFACT_ROOT=$MLFLOW_RUNS_DIR/artifacts
ENV EXTRA_MLFLOW_PARAMS=''
ENV PORT=5000
ENV HOST=0.0.0.0
RUN pip install --upgrade pip && pip install mlflow
ENTRYPOINT ["/bin/bash", "-c", "mlflow server -h $HOST -p $PORT \
--backend-store-uri $BACKEND_STORE_URI --default-artifact-root $DEFAULT_ARTIFACT_ROOT $EXTRA_MLFLOW_PARAMS"]