# Wartz's Contextual Reflections Page (WCRP)

Minimal static website served with nginx.

Contents

- app/: static site files (HTML, CSS, media)
- Dockerfile: static site container (nginx:alpine)
- .drone.yml: CI config that builds & pushes Docker image

Quick start (Docker)

1. Build the Docker image:
   docker build -t wcrp-web:local .

2. Run the image:
   docker run --rm -p 8080:80 wcrp-web:local

Open <http://localhost:8080> in your browser.

Quick start (docker-compose)

1. Build and run with docker-compose:
   docker-compose up --build

2. Open <http://localhost:8080>

Local dev helper (cross-platform)
This repo includes helper scripts to build and run the docker-compose setup locally.

- `scripts/run-local` — cross-platform wrapper (auto-selects PowerShell on Windows or the bash script on Unix).
- `scripts/run-local.sh` — bash script for Linux/macOS.
- `scripts/run-local.ps1` — PowerShell script for Windows PowerShell / PowerShell Core.

Usage examples:

### Default (build + up)

./scripts/run-local

### Explicit actions

./scripts/run-local up
./scripts/run-local down
./scripts/run-local restart

CI / Deployment
The project contains a `.drone.yml` pipeline which builds and pushes a Docker image to `jschlimmer/wcrp-web` when changes are pushed to the `master` branch.

Notes & ideas

- Contact form in `app/contact.html` is non-functional; consider integrating Formspree or a serverless function.
- Add a small `index.html` improvement for SEO (meta tags) or add more pages under `app/thots/`.

License
This repository did not include a license file. Add one if you intend to permit reuse.
