# Wartz's Contextual Reflections Page (WCRP)

Minimal static website served with nginx.

This repository contains static site files under `app/`, a small `Dockerfile` that serves the content with `nginx:alpine`, and helper scripts to run the site locally with `docker-compose`.

## Contents

- `app/` — static site files (HTML, CSS, media)
- `Dockerfile` — builds an nginx image that serves the `app/` content
- `docker-compose.yml` — development compose file (exposes port 8080)
- `scripts/` — helper scripts to run the site locally

## Requirements

- Docker (Engine)
- docker-compose (v1 or v2 compatible)
- Optional: PowerShell (Windows) or a POSIX shell for the helper scripts

## Quick start — Docker

1. From the repository root, build the image:

```bash
docker build -t wcrp-web:local .
```

1. Run the image:

```bash
docker run --rm -p 8080:80 wcrp-web:local
```

1. Open <http://localhost:8080> in your browser.

## Quick start — docker-compose

1. Build and run with docker-compose (recommended for local development):

```bash
docker-compose up --build
```

1. Open <http://localhost:8080>

The compose file maps host port 8080 to container port 80 and mounts `./app` into the container as read-only so you can edit files locally and see changes immediately.

## Local dev helper scripts

This repo includes helper scripts in `scripts/` to simplify local workflow:

- `scripts/run-local` — cross-platform wrapper (auto-selects PowerShell on Windows or the bash script on Unix). Ensure it's executable:

```bash
chmod +x scripts/run-local
```

- `scripts/run-local.sh` — bash script for Linux/macOS. Usage: `./scripts/run-local.sh [up|down|restart]` (default: `up`).
- `scripts/run-local.ps1` — PowerShell script for Windows. Usage: `./scripts/run-local.ps1 [up|down|restart]` (default: `up`).

Examples:

```bash
# default: build and bring up
./scripts/run-local

# explicit actions
./scripts/run-local up
./scripts/run-local down
./scripts/run-local restart
```

Notes:

- The scripts call `docker-compose -f ./docker-compose.yml` and will build the image when using `up`.
- On Windows the wrapper will try to run `pwsh` (PowerShell Core) and fall back to `powershell.exe` if necessary.

## CI / Deployment

This repository contains a `.drone.yml` pipeline (if present) that can build and push a Docker image when changes are pushed to `master`. Adjust CI configuration and image destination as needed for your deployment.

## Development notes & ideas

- The contact form in `app/contact.html` is static and not connected to a backend. Consider integrating Formspree, Netlify Forms, or a simple serverless endpoint for submissions.
- Site improvements: add meta/SEO tags, accessibility tweaks, or more pages.

## License

This project is released under the MIT License — see the `LICENSE` file for full terms.

## Contact

Open an issue or send a PR if you want help or changes.

