# ---- Base image (small & secure) ----
FROM python:3.10-slim

# ---- Create non-root user (security best practice) ----
RUN useradd -m appuser

# ---- Set working directory ----
WORKDIR /app

# ---- Install dependencies first (better caching) ----
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ---- Copy application code ----
COPY app.py .
COPY tests ./tests

# ---- Switch to non-root user ----
USER appuser

# ---- Expose application port ----
EXPOSE 5000

# ---- Run the app ----
CMD ["python", "app.py"]
