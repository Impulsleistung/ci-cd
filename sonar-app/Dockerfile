FROM python:3-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Hinzugefügter Abschnitt für Secret-Handling
ARG PERPLEXITY_API_TOKEN
ENV PERPLEXITY_API_TOKEN=${PERPLEXITY_API_TOKEN}

COPY . .

CMD ["python", "app.py"]