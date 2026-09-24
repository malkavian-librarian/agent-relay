FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

COPY pyproject.toml README.md ./
COPY main.py database.py storage.py schemas.py errors.py dashboard.py dashboard.html worker.py ./

RUN pip install --no-cache-dir fastapi sqlalchemy "uvicorn[standard]" pydantic-settings "psycopg[binary]" httpx

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
