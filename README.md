# DSA Coding Platform 🚀

An internal LeetCode-style platform for teams to practice DSA problems, track progress, and compete on a leaderboard.

![Tech Stack](https://img.shields.io/badge/Java-17-orange) ![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2-green) ![React](https://img.shields.io/badge/React-18-blue) ![TypeScript](https://img.shields.io/badge/TypeScript-5-blue) ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-blue)

## Features ✨

- **User Authentication** - JWT-based login/registration
- **Problem Management** - Admin can create problems with test cases
- **Multi-Language Support** - Java, C++, Python 3, Go
- **Code Editor** - Monaco Editor (VS Code's editor)
- **Real-time Evaluation** - Run against sample tests, Submit for full evaluation
- **Leaderboard** - Track team rankings by score
- **Points System** - Easy (10), Medium (25), Hard (50) points

## Tech Stack 🛠️

| Layer | Technology |
|-------|------------|
| Backend | Java 17, Spring Boot 3.2, Spring Security, JPA |
| Frontend | React 18, TypeScript, Monaco Editor, React Router |
| Database | PostgreSQL 15 |
| Build | Maven, Vite |
| Deployment | Docker, Docker Compose |

## Quick Start 🏃‍♂️

### Prerequisites

- Java 17+
- Node.js 18+
- PostgreSQL 15+ (or Docker)
- Maven 3.9+

### Option 1: Docker Compose (Recommended)

```bash
# Clone the repository
cd Dsa-Coding-Platform

# Set your admin email
export ADMIN_EMAIL=your-email@company.com

# Start all services
docker-compose up -d

# Open in browser
open http://localhost:3000
```

### Option 2: Local Development

#### 1. Start PostgreSQL

```bash
# Using Docker
docker run -d --name dsa-postgres \
  -e POSTGRES_DB=dsaplatform \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -p 5432:5432 \
  postgres:15-alpine
```

#### 2. Start Backend

```bash
cd backend

# Set environment variables
export ADMIN_EMAIL=your-email@company.com

# Run with development profile
mvn spring-boot:run -Dspring-boot.run.profiles=dev
```

Backend will start at `http://localhost:8080/api`

#### 3. Start Frontend

```bash
cd frontend

# Install dependencies
npm install

# Start development server
npm run dev
```

Frontend will start at `http://localhost:3000`

## Configuration ⚙️

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `ADMIN_EMAIL` | Email of the admin user | `admin@dsaplatform.com` |
| `DB_USERNAME` | Database username | `postgres` |
| `DB_PASSWORD` | Database password | `postgres` |
| `JWT_SECRET` | JWT signing key (256+ bits) | Auto-generated |

### Making Yourself Admin

When registering, if your email matches `ADMIN_EMAIL`, you'll automatically become an admin.

```bash
# Set before starting the backend
export ADMIN_EMAIL=your-email@company.com
```

## Usage 📖

### For Users:

1. **Register/Login** - Create an account with your email
2. **Browse Problems** - View all problems, filter by difficulty
3. **Solve Problems** - Write code, run against samples, submit for evaluation
4. **Track Progress** - View your rank on the leaderboard

### For Admins:

1. **Access Admin Dashboard** - Navigate to `/admin`
2. **Create Problems** - Add title, description (Markdown), constraints
3. **Add Test Cases** - Mark some as "sample" (visible to users)
4. **Manage Users** - (Coming soon)

## API Endpoints 📡

| Endpoint | Method | Description | Auth |
|----------|--------|-------------|------|
| `/api/auth/register` | POST | Register new user | Public |
| `/api/auth/login` | POST | Login | Public |
| `/api/auth/me` | GET | Get current user | Required |
| `/api/problems` | GET | List all problems | Public |
| `/api/problems/{slug}` | GET | Get problem details | Public |
| `/api/problems` | POST | Create problem | Admin |
| `/api/submissions` | POST | Submit solution | Required |
| `/api/submissions/run` | POST | Run against samples | Required |
| `/api/leaderboard` | GET | Get leaderboard | Public |

## Project Structure 📁

```
Dsa-Coding-Platform/
├── backend/                    # Spring Boot Backend
│   ├── src/main/java/com/dsaplatform/
│   │   ├── config/             # Security, CORS config
│   │   ├── controller/         # REST controllers
│   │   ├── dto/                # Request/Response DTOs
│   │   ├── model/              # JPA entities
│   │   ├── repository/         # JPA repositories
│   │   ├── security/           # JWT authentication
│   │   └── service/            # Business logic
│   └── src/main/resources/
│       ├── application.yml     # Production config
│       ├── application-dev.yml # Development config
│       └── db/migration/       # Flyway migrations
│
├── frontend/                   # React Frontend
│   ├── src/
│   │   ├── components/         # Reusable components
│   │   ├── context/            # React context (Auth)
│   │   ├── pages/              # Page components
│   │   └── services/           # API service
│   └── package.json
│
├── docker-compose.yml          # Docker orchestration
└── README.md
```

## Scoring System 🏆

| Difficulty | Points |
|------------|--------|
| Easy | 10 |
| Medium | 25 |
| Hard | 50 |

- Points awarded on **first accepted submission** only
- Re-submissions don't affect score
- Leaderboard ranks by total score

## Production Deployment 🚀

### Build Production JAR

```bash
cd backend
mvn clean package -DskipTests
# JAR at target/dsa-platform-1.0.0.jar
```

### Deploy to Server

```bash
# Copy JAR to server
scp target/dsa-platform-1.0.0.jar user@server:/app/

# On server
export SPRING_DATASOURCE_URL=jdbc:postgresql://localhost:5432/dsaplatform
export SPRING_DATASOURCE_USERNAME=postgres
export SPRING_DATASOURCE_PASSWORD=your-password
export JWT_SECRET=your-256-bit-secret
export ADMIN_EMAIL=admin@yourcompany.com

java -jar /app/dsa-platform-1.0.0.jar
```

### Deploy with Docker

```bash
# Build and push images
docker-compose build
docker-compose push

# On server
docker-compose pull
docker-compose up -d
```

## Security Notes 🔒

- Change `JWT_SECRET` in production (256+ bits)
- Use HTTPS in production (nginx reverse proxy)
- Code execution runs in isolated temp directories
- For production, consider Docker sandbox for code execution

## Contributing 🤝

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License 📄

MIT License - feel free to use for your team!

---

Built with ❤️ for DSA enthusiasts
