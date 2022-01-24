### About
Docker image to run MLFlow on local machine with sqlite backend storage.

### Instructions

#### Build Docker image
```
docker build -f Dockerfile . -t mlflow-sqlite-server
```

#### Run Docker image
```
docker run -p 5000:5000 -v /home/matej/mlruns:/data mlflow-sqlite-server
```
#### Access dashboard

http://localhost:5000

#### Env variables
See ```Dockerfile``` for ENV variables to set path / port.
By default database is found in ```/data/mlflow.db``` within the Docker image.