#!/usr/bin/env bash
# Helper script to build and run the site locally using docker-compose on Linux/macOS.
# Usage: ./scripts/run-local.sh [up|down|restart]

set -euo pipefail

ACTION=${1:-up}

# Resolve the directory of this script and find the repository root (one level up from scripts)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="${SCRIPT_DIR}/.."
COMPOSE_FILE="${REPO_ROOT}/docker-compose.yml"

echo "Using docker-compose file at: ${COMPOSE_FILE}"

case "${ACTION,,}" in
  up)
    docker-compose -f "${COMPOSE_FILE}" up --build
    ;;
  down)
    docker-compose -f "${COMPOSE_FILE}" down
    ;;
  restart)
    docker-compose -f "${COMPOSE_FILE}" down
    docker-compose -f "${COMPOSE_FILE}" up --build
    ;;
  -h|--help|help)
    echo "Usage: $(basename "$0") [up|down|restart]"
    exit 0
    ;;
  *)
    echo "Unknown action: ${ACTION}. Use up|down|restart"
    exit 2
    ;;
esac
