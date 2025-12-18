#!/bin/bash
set -e

echo "Pulling latest changes..."
git pull origin main

echo "Creating required directories..."
mkdir -p services/pihole/etc-pihole
mkdir -p services/diun/data

echo "Pulling latest Docker images..."
docker compose pull

echo "Starting services..."
docker compose up -d

echo "Giving time for services to start..."
sleep 3

echo "Deployment complete!"

docker compose ps

echo ""
echo "🌐 Access Pi-hole at: http://$(hostname -I | awk '{print $1}')/admin"
echo ""
