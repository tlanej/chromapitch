#!/bin/bash

# Chromesthesia Trainer - Startup Script
# Usage: ./run.sh [option]
# Options:
#   docker    - Run with Docker Compose (default)
#   build     - Build and run with Docker directly
#   python    - Run with Python's built-in HTTP server
#   node      - Run with Node's http-server (if installed)

set -e

PORT=${PORT:-8080}
APP_NAME="chromesthesia-trainer"

case "${1:-docker}" in
  docker)
    echo "🎵 Starting Chromesthesia Trainer with Docker Compose..."
    echo "   Access at: http://localhost:$PORT"
    docker-compose up --build -d
    echo "✓ Running! Open http://localhost:$PORT"
    echo "  Stop with: docker-compose down"
    ;;
    
  build)
    echo "🎵 Building and running with Docker..."
    docker build -t $APP_NAME .
    docker run -d --name $APP_NAME -p $PORT:80 $APP_NAME
    echo "✓ Running! Open http://localhost:$PORT"
    echo "  Stop with: docker stop $APP_NAME && docker rm $APP_NAME"
    ;;
    
  python)
    echo "🎵 Starting with Python HTTP server..."
    echo "   Access at: http://localhost:$PORT"
    python3 -m http.server $PORT
    ;;
    
  node)
    echo "🎵 Starting with Node http-server..."
    if ! command -v npx &> /dev/null; then
      echo "Error: npx not found. Install Node.js or use another option."
      exit 1
    fi
    echo "   Access at: http://localhost:$PORT"
    npx http-server -p $PORT -c-1
    ;;
    
  stop)
    echo "🛑 Stopping Chromesthesia Trainer..."
    docker-compose down 2>/dev/null || docker stop $APP_NAME 2>/dev/null && docker rm $APP_NAME 2>/dev/null || true
    echo "✓ Stopped"
    ;;
    
  *)
    echo "Chromesthesia Trainer - Startup Options"
    echo ""
    echo "Usage: ./run.sh [option]"
    echo ""
    echo "Options:"
    echo "  docker  - Run with Docker Compose (default, recommended)"
    echo "  build   - Build and run with Docker directly"
    echo "  python  - Run with Python's built-in HTTP server"
    echo "  node    - Run with Node's http-server"
    echo "  stop    - Stop running containers"
    echo ""
    echo "Environment:"
    echo "  PORT=8080  - Change the port (default: 8080)"
    echo ""
    echo "Examples:"
    echo "  ./run.sh              # Start with Docker Compose"
    echo "  ./run.sh python       # Start with Python"
    echo "  PORT=3000 ./run.sh    # Start on port 3000"
    ;;
esac
