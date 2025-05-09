# Project Overview

| GitHub Repository                                                                                | Dockerhub Repository              | Description                    |
| ------------------------------------------------------------------------------------------------ | --------------------------------- | ------------------------------ |
| [staticSite](https://github.com/Impulsleistung/ci-cd/tree/main/staticSite)                       | imp2/standard-website:latest      | Static Homepage                |
| [gradio-text-converter](https://github.com/Impulsleistung/ci-cd/tree/main/gradio-text-converter) | imp2/gradio-text-converter:latest | The Markdown Converter         |
| [fastapi-app](https://github.com/Impulsleistung/ci-cd/tree/main/fastapi-app)                     | imp2/standard-api:latest          | A FastAPI                      |
| [docker-firefox](https://github.com/Impulsleistung/ci-cd/tree/main/docker-firefox)               | imp2/ubuntu-firefox               | An Ubuntu Desktop with Firefox |
| [sonar-app](https://github.com/Impulsleistung/ci-cd/tree/main/sonar-app)                         | imp2/sonar-app                    | A Perplexity Sonar App         |
| [ollama-webui](https://github.com/Impulsleistung/ci-cd/tree/main/ollama-webui)                   | imp2/open-webui-ollama            | Open WebUI Bundled with Ollama |

## Prerequisites
- Docker must be installed and configured
- Docker Compose must be installed
- Required environment variables:
  - `DOCKERHUB_TOKEN` - For Docker Hub authentication
  - `VNC_PW_KEVIN` - For Firefox VNC password
  - `PERPLEXITY_API_TOKEN` - For Sonar App

## Port Mappings

| Application           | External Port | Internal Port | Protocol |
| --------------------- | ------------- | ------------- | -------- |
| Static Website        | 8081          | 80            | HTTP     |
| Gradio Text Converter | 8082          | 7860          | HTTP     |
| FastAPI App           | 8083          | 80            | HTTP     |
| Docker Firefox        | 8084          | 6901          | HTTP     |
| Sonar App             | 8085          | 7860          | HTTP     |
| Ollama WebUI Frontend | 8086          | 8080          | HTTP     |
| Ollama WebUI Backend  | 11434         | 11434         | HTTP     |

## Setup and Execution

### Static Website
1. Build the image:
   ```bash
   docker build -t imp2/standard-website:latest ./staticSite
   ```
2. Start the container:
   ```bash
   docker run -d -p 8081:80 imp2/standard-website:latest
   ```
3. Access the website:
   ```
   http://localhost:8081
   ```

### Gradio Text Converter
1. Build the image:
   ```bash
   docker build -t imp2/gradio-text-converter:latest ./gradio-text-converter
   ```
2. Start the container:
   ```bash
   docker run -d -p 8082:7860 imp2/gradio-text-converter:latest
   ```
3. Access the interface:
   ```
   http://localhost:8082
   ```

### FastAPI App
1. Build the image:
   ```bash
   docker build -t imp2/standard-api:latest ./fastapi-app
   ```
2. Start the container:
   ```bash
   docker run -d -p 8083:80 imp2/standard-api:latest
   ```
3. Test the API:
   ```bash
   # Test root endpoint
   curl http://localhost:8083/
   
   # Test items endpoint
   curl "http://localhost:8083/items/123?q=test"
   ```

### Docker Firefox
1. Build the image:
   ```bash
   docker build -t imp2/ubuntu-firefox:latest \
     --build-arg VNC_PW_KEVIN=${VNC_PW_KEVIN} \
     ./docker-firefox
   ```
2. Start the container:
   ```bash
   docker run -d -p 8084:6901 \
     --name firefox \
     --hostname firefox \
     imp2/ubuntu-firefox:latest
   ```
3. Access Firefox:
   ```
   http://localhost:8084
   ```
   Note: Use the VNC password set via VNC_PW_KEVIN

### Sonar App
1. Build the image:
   ```bash
   docker build -t imp2/sonar-app:latest ./sonar-app
   ```
2. Start the container:
   ```bash
   docker run -d -p 8085:7860 imp2/sonar-app:latest
   ```
3. Access the interface:
   ```
   http://localhost:8085
   ```
   Note: Enter your PERPLEXITY_API_TOKEN in the user interface

### Open WebUI with Ollama
1. Build the images:
   ```bash
   docker compose -f ./ollama-webui/docker-compose.yml build
   ```
2. Start the containers:
   ```bash
   docker compose -f ./ollama-webui/docker-compose.yml up -d
   ```
3. Access the WebUI:
   ```
   http://localhost:8086
   ```

## Docker Hub Publishing
All images can be published to Docker Hub using:
```bash
# Login to Docker Hub
docker login -u imp2 -p ${DOCKERHUB_TOKEN}

# Push the image (replace TAG with the specific image tag)
docker push imp2/TAG:latest
```
