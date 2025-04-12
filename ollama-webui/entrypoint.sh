#!/bin/sh

# Starte Ollama-Dienst im Hintergrund
ollama serve &

# Warte bis der Backend-Dienst auf Port 11434 erreichbar ist
until nc -z localhost 11434; do
    echo "Warte auf Backend-Dienst..."
    sleep 2
done

echo "Backend-Dienst ist verfügbar, lade Modell herunter..."
ollama pull gemma3:1b

# Warte dauerhaft, um Container am Laufen zu halten
wait
