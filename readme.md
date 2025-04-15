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
- Docker must be installed and configured.
- Docker Compose must be installed.

## Setup and Execution

### FastAPI App
1. Build the image:
   ```
   docker build ./fastapi-app --file ./fastapi-app/Dockerfile --tag imp2/standard-api:latest
   ```
2. Start the container:
   ```
   docker run -p 80:80 imp2/standard-api:latest
   ```
3. Test the API:
   Open a new terminal window and run the following command to test the API:
   ```
   curl http://localhost/
   ```
   Expected output:
   ```json
   {"message": "Hello World"}
   ```
   Additionally, you can test a specific endpoint:
   ```
   curl "http://localhost/items/123?q=test"
   ```
   Expected output:
   ```json
   {"item_id":123,"q":"test"}
   ```

### Gradio Text Converter
1. Build the image:
   ```
   docker build ./gradio-text-converter --file ./gradio-text-converter/Dockerfile --tag imp2/gradio-text-converter:latest
   ```
2. Start the container:
   ```
   docker run -p 7860:7860 imp2/gradio-text-converter:latest
   ```

### Static Website
1. Build the image:
   ```
   docker build ./staticSite --file ./staticSite/Dockerfile --tag imp2/standard-website:latest
   ```
3. Start the container:
   ```
   docker run -p 80:80 imp2/standard-website:latest
   ```

### Docker Firefox
1. Build the image:
   ```
   docker build ./docker-firefox --file ./docker-firefox/Dockerfile --tag imp2/ubuntu-firefox:latest
   ```
2. Start the container:
   ```
   docker run -d -p "36901:6901" --name quick --hostname quick imp2/ubuntu-firefox:latest
   ```

### Sonar App
1. Build the image:
   ```
   docker build ./sonar-app --file ./sonar-app/Dockerfile --tag imp2/sonar-app:latest
   ```
2. Start the container:
   ```
   docker run -p 7860:7860 imp2/sonar-app:latest
   # Note: Enter your PERPLEXITY_API_TOKEN in the user interface.
   # Note: The app provides answers with a maximum of 200 words and without links.
   ```

### Open WebUI with Ollama
1. Build images (Frontend and Backend):
   ```
   docker-compose -f ./ollama-webui/docker-compose.yml build
   ```
2. Start the containers:
   ```
   docker-compose -f ./ollama-webui/docker-compose.yml up
   ```
3. Access the WebUI:
   Open in the browser:
   ```
   http://localhost
   ```
   Note: The model `gemma3:1b` is automatically downloaded on the first start.
