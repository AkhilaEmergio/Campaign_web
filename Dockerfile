ARG PYTHON_VERSION=3.11.9
FROM python:${PYTHON_VERSION}-slim as base

# Prevent Python from writing pyc files and buffering output
ENV PYTHONDONTWRITEBYTECODE=1 \
   PYTHONUNBUFFERED=1

WORKDIR /campaign

# Install system dependencies
RUN apt-get update && apt-get install -y \
   build-essential \
   pkg-config \
   default-libmysqlclient-dev \
   cron && \
   rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN --mount=type=cache,target=/root/.cache/pip \
   --mount=type=bind,source=requirements.txt,target=requirements.txt \
   python -m pip install --no-cache-dir -r requirements.txt && \
   pip install six

# Copy the source code into the container
COPY . .
# Expose the port the application listens on
EXPOSE 8005

# Run the application
CMD gunicorn campaign_web.asgi:application --bind 0.0.0.0:8005 --workers 4 --worker-class uvicorn.workers.UvicornWorker