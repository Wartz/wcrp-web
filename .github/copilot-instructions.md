# Copilot Instructions for WCRP Web

## Project Overview
- This is a minimal static website served by nginx, with all site files in `app/`.
- The site is containerized using a simple `Dockerfile` and can be run locally via `docker-compose` or helper scripts in `scripts/`.

## Key Directories & Files
- `app/`: Contains all static content (HTML, CSS, media). No backend logic.
- `Dockerfile`: Builds an nginx image serving the `app/` directory. Uses `docker.io/nginx:alpine` as the base image.
- `docker-compose.yml`: Exposes port 8080, mounts `./app` as read-only for live editing.
- `scripts/`: Contains cross-platform scripts for local dev (`run-local`, `run-local.ps1`, `run-local.sh`).

## Developer Workflow
- Build with `docker build -t wcrp-web:local .` from repo root.
- Run with `docker run --rm -p 8080:80 wcrp-web:local` or use `docker-compose up --build` for local development.
- For convenience, use `./scripts/run-local` (auto-selects PowerShell/bash) or platform-specific scripts with `[up|down|restart]` arguments.
- Changes to files in `app/` are reflected live when using `docker-compose` (due to volume mount).

## Patterns & Conventions
- No dynamic backend; all content is static.
- No build step for static assets; edit files in `app/` directly.
- Scripts are designed to work cross-platform (Windows/Unix) and auto-select the correct shell.
- The contact form in `app/contact.html` is not functional—no backend integration.

## Integration & CI
- If `.drone.yml` exists, it defines CI for building/pushing Docker images on changes to `master`.
- No other external integrations or service boundaries.

## Examples
- To add a new page, create an HTML file in `app/` and link it from `index.html`.
- To update styles, edit `app/css/site.css`.
- To change the logo, replace files in `app/media/logo/`.

## Tips for AI Agents
- Focus on static site patterns; do not add backend logic unless explicitly requested.
- Use Docker and docker-compose for all local and CI workflows.
- Reference `README.md` for up-to-date workflow and usage details.
- Scripts in `scripts/` are the preferred way to run the site locally, especially for cross-platform compatibility.

---
If any workflow or pattern is unclear, ask the user for clarification before making changes.
