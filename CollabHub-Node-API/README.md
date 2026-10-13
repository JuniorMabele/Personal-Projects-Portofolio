# CollabHub — Node.js Team Collaboration API

An Express REST API for a small team's shared workspace. It manages members, tasks, and progress updates with an in-memory data layer, making it simple to run without a database.

## Features
- RESTful health, members, tasks, and updates endpoints
- Create and update tasks with validation
- Share progress updates with timestamps
- CORS support for a separate React frontend
- Static API documentation landing page

## Run locally

```bash
npm install
npm start
```

Open `http://localhost:3000`. API responses are available under `/api`.

## Technologies
Node.js, Express, JavaScript, REST, CORS
