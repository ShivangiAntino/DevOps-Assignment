# Secure-CRUD: Multi-Container Tasks Management System

A secure, multi-container CRUD application built with Node.js, PostgreSQL, and NGINX. Designed for easy deployment and full configurability via environment variables.

## 🚀 Key Features

- **Multi-Container Architecture**: Orchestrated via Docker Compose.
- **Reverse Proxy**: NGINX acts as a gateway for the application.
- **Database-Driven**: PostgreSQL for reliable data storage.
- **Fully Configurable**: No hard-coded values; everything is managed through `.env`.
- **Security Focused**: Runs as a non-root user in Docker; sensitive data is environment-driven.

## 🛠️ Tech Stack

- **Backend**: Node.js (Express)
- **Database**: PostgreSQL 15
- **Proxy**: NGINX (Alpine)
- **Containerization**: Docker & Docker Compose

## 📂 Project Structure

```text
Secure-CRUD/
├── nginx/             # NGINX configuration templates
├── src/               # Node.js source code
├── .env               # Environment configuration (single source of truth)
├── .gitignore         # Git exclusion rules
├── docker-compose.yml # Service orchestration
└── deploy.sh          # Automated deployment script
```

## ⚙️ Setup & Installation

### 1. Prerequisites
- Docker & Docker Compose installed on your system.
- Git (optional, for cloning).

### 2. Configure Environment Variables
Create or update the `.env` file in the root directory:
```env
DB_USER=postgres
DB_PASS=yourpassword
DB_NAME=securecrud
DB_HOST=db
PORT=5000
NGINX_PORT=80
```

### 3. Deploy the Application
Run the automated deployment script:
```bash
./deploy.sh
```
Or use Docker Compose manually:
```bash
docker-compose up --build -d
```

## 🧪 Testing the API

Once the application is live at `http://localhost`, use the following endpoints:

| Action | Method | Endpoint | Description |
| :--- | :--- | :--- | :--- |
| **Add** | POST | `/tasks` | Create a new task (body: `{"title": "Task 1"}`) |
| **Read** | GET | `/tasks` | Retrieve all tasks |
| **Update**| PUT | `/tasks/:id` | Update a task by ID |
| **Delete**| DELETE | `/tasks/:id` | Remove a task by ID |

