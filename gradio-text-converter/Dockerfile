FROM python:3-slim

WORKDIR /app

RUN apt-get update && apt-get install -y pandoc && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 7860

CMD ["python", "main.py"]
