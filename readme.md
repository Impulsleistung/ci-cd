# Projektübersicht

Dieses Repository enthält vier Applikationen:
- FastAPI App
- Gradio Text Converter
- Static Website
- Docker Firefox

## Voraussetzungen
- Docker muss installiert und konfiguriert sein.

## Aufbau und Ausführung

### FastAPI App
1. Image bauen:
   ```
   docker build ./fastapi-app --file ./fastapi-app/Dockerfile --tag imp2/standard-api:latest
   ```
2. Container starten:
   ```
   docker run -p 80:80 imp2/standard-api:latest
   ```
3. API testen:
   Öffne ein neues Terminalfenster und führe folgenden Befehl aus, um die API zu testen:
   ```
   curl http://localhost/
   ```
   Erwartete Ausgabe:
   ```json
   {"message": "Hello World"}
   ```
   Zusätzlich kannst du einen spezifischen Endpunkt testen:
   ```
   curl "http://localhost/items/123?q=test"
   ```
   Erwartete Ausgabe:
   ```json
   {"item_id":123,"q":"test"}
   ```

### Gradio Text Converter
1. Image bauen:
   ```
   docker build ./gradio-text-converter --file ./gradio-text-converter/Dockerfile --tag imp2/gradio-text-converter:latest
   ```
2. Container starten:
   ```
   docker run -p 7860:7860 imp2/gradio-text-converter:latest
   ```

### Static Website
1. Image bauen:
   ```
   docker build ./staticSite --file ./staticSite/Dockerfile --tag imp2/standard-website:latest
   ```
2. Container starten:
   ```
   docker run -p 80:80 imp2/standard-website:latest
   ```

### Docker Firefox
1. Image bauen:
   ```
   docker build ./docker-firefox --file ./docker-firefox/Dockerfile --tag imp2/ubuntu-firefox:latest
   ```
2. Container starten:
   ```
   docker run -d -p "36901:6901" --name quick --hostname quick imp2/ubuntu-firefox:latest
   ```

## Hinweise
- Alternativ können die GitHub Workflows zur CI/CD genutzt werden, die bei Push oder Pull Request auf den `main`-Branch automatisch die Builds und das Deployment auf Docker Hub auslösen.
- Passe ggf. Portzuweisungen an, falls sie in Konflikt mit anderen lokalen Diensten stehen.
