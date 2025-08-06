# Docker Projects Overview

## Quick Reference

| Project               | Image                                                                               | Ports                         | Build & Run Commands                                                                                                                                                                                  |
| --------------------- | ----------------------------------------------------------------------------------- | ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Static Website        | `imp2/standard-website:latest`                                                      | 8081:80                       | ```docker build -t imp2/standard-website:latest ./staticSite && docker run -d -p 8081:80 imp2/standard-website:latest```                                                                              |
| Gradio Text Converter | `imp2/gradio-text-converter:latest`                                                 | 8082:7860                     | ```docker build -t imp2/gradio-text-converter:latest ./gradio-text-converter && docker run -d -p 8082:7860 imp2/gradio-text-converter:latest```                                                       |
| FastAPI App           | `imp2/standard-api:latest`                                                          | 8083:80                       | ```docker build -t imp2/standard-api:latest ./fastapi-app && docker run -d -p 8083:80 imp2/standard-api:latest```                                                                                     |
| Docker Firefox        | `imp2/ubuntu-firefox:latest`                                                        | 8084:6901                     | ```docker build -t imp2/ubuntu-firefox:latest --build-arg VNC_PW_KEVIN=${VNC_PW_KEVIN} ./docker-firefox && docker run -d -p 8084:6901 --name firefox --hostname firefox imp2/ubuntu-firefox:latest``` |
| Sonar App             | `imp2/sonar-app:latest`                                                             | 8085:7860                     | ```docker build -t imp2/sonar-app:latest ./sonar-app && docker run -d -p 8085:7860 imp2/sonar-app:latest```                                                                                           |
| MkDocs Site           | `imp2/mkdocs-site:latest`                                                           | Dev: 8000:8000<br>Prod: 80:80 | ```docker compose -f ./mkdocsStaticSite/docker-compose.yml up mkdocs``` (Dev)<br>```docker compose -f ./mkdocsStaticSite/docker-compose.yml --profile production up``` (Prod)                         |
| Ollama WebUI          | `imp2/open-webui-ollama:frontend-latest`<br>`imp2/open-webui-ollama:backend-latest` | 8086:8080,<br>11434:11434     | ```docker compose -f ./ollama-webui/docker-compose.yml up -d```                                                                                                                                       |

## CI/CD Status

Für jedes Projekt existiert ein eigener GitHub Actions Workflow, der automatisch bei jedem Push oder Pull Request auf den `main`-Branch ausgelöst wird. Die Workflows bauen die jeweiligen Docker Images und pushen sie zu Docker Hub.

## Required Environment Variables

- `DOCKERHUB_TOKEN` - For Docker Hub authentication
- `VNC_PW_KEVIN` - For Firefox VNC password
- `PERPLEXITY_API_TOKEN` - For Sonar App

## Access URLs

- Static Website: http://localhost:8081
- Gradio Text Converter: http://localhost:8082
- FastAPI App: http://localhost:8083
- Docker Firefox: http://localhost:8084
- Sonar App: http://localhost:8085
- Ollama WebUI: http://localhost:8086
- MkDocs Site: http://localhost:8000 (Dev) or http://localhost (Prod)
