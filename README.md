# React + Hono Boilerplate

A simple full-stack starter with a **React** frontend, a **Hono** API, and a **Postgres** database. Postgres runs in Docker so you do not need to install it directly on your machine.

## Project Structure

- `api` - Hono backend API, Drizzle ORM, PostgreSQL
- `ui` - React frontend, Vite, TanStack Router, Tailwind CSS, shadcn/ui
- `docker-compose.yml` - Local Postgres database for development

## Prerequisites

Install these once:

- [Node.js](https://nodejs.org/) 24 LTS
- npm
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) or Docker Engine with Docker Compose

You do not need to install Postgres locally.

This repo includes `.nvmrc` files in `api` and `ui` with `v24`, so tools like `nvm` and `fnm` can switch Node versions automatically when you enter those folders.

## Quick Start

### 1. Clone the Repository

```bash
git clone <repository-url>
cd react-hono-boilerplate
```

### 2. Start Postgres

From the project root:

```bash
docker compose up -d
```

This starts a Postgres container on `localhost:6432` and stores its data in a Docker volume.

The default local database credentials are:

```env
DB_USER=postgres
DB_PASSWORD=password
DB_NAME=test1
```

### 3. Start the API

In one terminal:

```bash
cd api
npm install
cp .env.example .env
npm run seedDatabase
npm start
```

The API runs at `http://localhost:3000`.

Before using AI chat features, replace `AI_API_KEY=replace_with_your_ai_api_key` in `api/.env` with a real key.

### 4. Start the UI

In a second terminal:

```bash
cd ui
npm install
cp .env.start.example .env.start
npm start
```

The UI runs at `http://localhost:5173`.

## Mental Model

Yes, during local development you still have two app servers:

- The API server: `http://localhost:3000`
- The UI dev server: `http://localhost:5173`

Docker is only running the database:

```text
Browser -> Vite UI -> Hono API -> Docker Postgres
```

This keeps the beginner workflow easy to debug. You get normal Node/Vite hot reload locally, while Docker removes the need to install and manage Postgres on your machine.

## Daily Development

After the first setup, start the database from the project root:

```bash
docker compose up -d
```

Then start the API:

```bash
cd api
npm start
```

And start the UI in another terminal:

```bash
cd ui
npm start
```

To stop Postgres:

```bash
docker compose down
```

To stop Postgres and delete the local database data:

```bash
docker compose down -v
```

Use `docker compose down -v` after changing Postgres user, password, or database name. A plain `docker compose down` stops the container but keeps the existing database volume.

## Environment Files

The repository includes safe example files:

- `api/.env.example`
- `ui/.env.start.example`

Copy them to real env files during setup. Real env files are ignored by git.

## Available Scripts

### API

- `npm start` - Start the API server in watch mode
- `npm run compile` - Type-check the TypeScript code
- `npm run format` - Format code using Prettier
- `npm run test` - Run tests
- `npm run db:push` - Push the Drizzle schema to the database
- `npm run db:generate` - Generate database migrations
- `npm run db:migrate` - Run database migrations
- `npm run db:studio` - Open Drizzle Studio
- `npm run seedDatabase` - Push schema changes and seed initial data

### UI

- `npm start` - Start the Vite development server
- `npm run build` - Build for production
- `npm run preview` - Preview the production build
- `npm run compile` - Type-check the TypeScript code
- `npm run format` - Format code using Prettier

## What's Included

- Type-safe API client wiring between React and Hono
- Drizzle ORM with PostgreSQL
- Zod validation
- TanStack Router
- Tailwind CSS and shadcn/ui components
- API request logging, CORS, compression, and rate limiting
- Hot reload for API and UI development

## Full Docker Later

This setup intentionally Dockerizes only Postgres. A full Docker Compose stack for Postgres, API, and UI can be added later for demos or deployment-like local testing, but it adds more moving parts for day-to-day development.

## License

MIT License - you are free to use, modify, and distribute this project.
