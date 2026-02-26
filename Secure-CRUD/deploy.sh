#!/bin/bash

# Exit on error
set -e

echo "Checking Prerequisites..."
if ! command -v docker &> /dev/null; then
    echo "[ERROR] Docker is not installed."
    exit 1
fi

if ! docker compose version &> /dev/null; then
    echo "[ERROR] Docker Compose is not installed."
    exit 1
fi

# Load environment variables
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

echo "Cleaning old state..."
docker compose down -v

echo "Building & Starting services..."
docker compose up --build -d

echo "Waiting for services to be healthy..."
MAX_RETRIES=10
RETRY_COUNT=0

# Use NGINX_PORT or default to 80
CHECK_PORT=${NGINX_PORT:-80}

until $(curl -sSf http://localhost:$CHECK_PORT/ > /dev/null 2>&1); do
    if [ $RETRY_COUNT -eq $MAX_RETRIES ]; then
        echo "[ERROR] Application failed to start in time."
        docker compose logs
        exit 1
    fi
    echo "Waiting for application (Attempt $((RETRY_COUNT+1))/$MAX_RETRIES)..."
    sleep 5
    RETRY_COUNT=$((RETRY_COUNT+1))
done

echo "[SUCCESS] Application is live at http://localhost:$CHECK_PORT"