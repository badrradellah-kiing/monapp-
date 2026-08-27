FROM python:3.12-slim

# Mettre à jour les paquets système (corrige les CVE de la base)
RUN apt-get update && apt-get upgrade -y \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

RUN useradd --create-home appuser
USER appuser

CMD ["python", "app.py"]
