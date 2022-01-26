## About
### Introduction
Purpose of this tool is to have
a quick out of the box MLFlow deployment for local experimentation or more. 

No need to think hard - just copy 
[commands](#howto) from this README and start using MLFlow right away! 

### What is this
Docker container with mlflow pre-installed and pre-configured to write 
files into a local directory.


### How does it persist data
Data is stored into 1 configurable "mlruns" directory. MLFlow will write to this folder:
1. SQLite database for backend store (metrics, parameters, etc...)
2. Directory for artifact store (larger files - datasets, models, etc...).

By default backend is stored in SQLite file ```mlflow.db``` and artifacts in 
folder called ```artifacts```.

See [advanced configuration guide](#advconf) or Dockerfile to configure different backend & artifact storage options.

## License
Apache License 2.0, feel free to do anything with it!

## <a name="howto"></a>How to use
### Requirements
- Docker installed https://docs.docker.com/get-docker/
- That's it!
### Quickstart
#### 1. Build Docker image
```
docker build -f Dockerfile . -t mlflow-sqlite-server:latest
```

#### 2. Run Docker image
Map port 5000 and provide mount a local dir where data will be persisted.
```
docker run -p 5000:5000 -v <YOUR LOCAL DIR>:/data mlflow-sqlite-server:latest
```
#### 3. Access dashboard
http://localhost:5000
## <a name="advconf"></a>Advanced configuration
Configuration can be done via ENV variables passed to docker image at run time
using ```-e``` option of ```docker run```. See Dockerfile for details on 
what variables are used and how.

### Available ENV Variables 
```BACKEND_STORE_URI``` - completely override backend store URI argument. Enables
you to change backend store dialect from SQLite to something else supported by MLFLow:
https://mlflow.org/docs/latest/tracking.html#backend-stores

```DEFAULT_ARTIFACT_ROOT``` - set root folder where artifacts will be written. Can be local
directory or any other MLFlow supported dialect:
https://mlflow.org/docs/latest/tracking.html#artifact-stores

```EXTRA_MLFLOW_PARAMS``` - Add any other options of mlflow serve command
(e.g. ```"--serve artifacts -w 16"```)