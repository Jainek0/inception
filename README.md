*This project has been created as part of the 42 curriculum by thcaquet.*

## Description

The Inception project is a comprehensive Docker-based solution that demonstrates containerization and service orchestration. This project creates a complete infrastructure using Docker containers, enabling efficient deployment and management of multiple services in an isolated and reproducible environment. The goal is to understand and implement Docker best practices, networking, and volume management while following infrastructure-as-code principles.

## Instructions

### Prerequisites
- Docker and Docker Compose installed on your system
- Make installed for using the Makefile

### Build and Run

1. **Clone the repository:**
   ```bash
   git clone inception@42
   cd inception
   ```

2. **Build the Docker images and Start all containers:**
   ```bash
   make
   ```

3. **Stop all containers:**
   ```bash
   make down
   ```

4. **Clean up (remove containers):**
   ```bash
   make clean
   ```

4.1 **Full Clean (remove system resources):**
```bash
make fclean
```

4.2 **Super full clean (remove everything including persistent volumes):**
```bash
make sfclean
```

### Project Structure

- **Dockerfile:** Contains Docker image definitions for containerized services
- **Makefile:** Provides convenient commands for building, running, and managing containers
- **Shell scripts:** Automate configuration and initialization tasks within containers

```
                           - - - - - (           git clone          ) - - - - -
inception/                  
│
├── Makefile
├── .env
│
├── srcs/
│   ├── docker-compose.yml
│   └── requirements/
│       ├── nginx/
│       ├── wordpress/
│       └── mariadb/

                           - - - - - (   generate persitant volume   ) - - - - -
home/$(login)/data/                      
 ├── wordpress/
 └── mariadb/
```
## Technical Architecture

<img width="608" height="693" alt="Screenshot from 2026-04-23 09-34-02" src="https://github.com/user-attachments/assets/62b1bc2c-e807-4a6e-ad29-5459fc068f56" />


### Docker Usage

This project leverages Docker to create isolated, reproducible environments. Each service runs in its own container with specific configurations, dependencies, and network settings. Docker Compose orchestrates these containers, managing their lifecycle, networking, and storage.

### Key Comparisons

#### Virtual Machines vs Docker Containers
| Aspect | Virtual Machines | Docker Containers |
|--------|------------------|-------------------|
| **Size** | Gigabytes (full OS) | Megabytes (shared kernel) |
| **Startup Time** | Minutes | Seconds |
| **Resource Usage** | High (full OS overhead) | Low (minimal overhead) |
| **Portability** | OS-dependent | Platform-agnostic |
| **Isolation** | Strong (separate kernel) | Moderate (shared kernel) |

**Conclusion:** Docker containers are preferred for this project due to their lightweight nature, fast startup times, and portability, making them ideal for development and deployment workflows.

#### Secrets vs Environment Variables
| Feature | Environment Variables | Secrets |
|---------|----------------------|---------|
| **Security** | Plain text (visible in logs) | Encrypted/protected |
| **Use Case** | Non-sensitive config (ports, hosts) | Sensitive data (passwords, tokens) |
| **Management** | Simple, easy to manage | More secure, requires careful handling |
| **Best Practice** | Configuration values | Credentials and sensitive information |

**Recommendation:** Use environment variables for configuration settings and Docker secrets (or `.env` files for development) for sensitive credentials.

#### Docker Network vs Host Network
| Aspect | Docker Network (bridge) | Host Network |
|--------|------------------------|--------------|
| **Isolation** | Isolated network namespace | Uses host's network namespace |
| **Security** | Better isolation between containers | Less isolated |
| **Performance** | Slight overhead | Direct host access (faster) |
| **Use Case** | Multi-container applications | Single-service or performance-critical apps |
| **Port Mapping** | Explicit port mapping required | Direct port access |

**Choice for this project:** Docker Network (bridge mode) for better security and isolation between services.

#### Docker Volumes vs Bind Mounts
| Feature | Docker Volumes | Bind Mounts |
|---------|----------------|------------|
| **Management** | Managed by Docker | Managed by user |
| **Portability** | Portable across hosts | Host-dependent paths |
| **Performance** | Optimized for Docker | Potential performance overhead |
| **Use Case** | Production data persistence | Development and debugging |
| **Backup** | Easier to backup | Manual management |

**Strategy for this project:** 
- Use Docker Volumes for persistent data (databases, etc.)
- Use Bind Mounts for development (source code mounting)

## Resources

### Docker & Containerization
- [Docker Official Documentation](https://docs.docker.com/)
- [Docker Compose Reference](https://docs.docker.com/compose/)
- [Docker Best Practices](https://docs.docker.com/develop/dev-best-practices/)

### System Administration & Infrastructure
- [Linux Containers Documentation](https://linuxcontainers.org/)
- [Networking in Docker](https://docs.docker.com/network/)

### Makefile & Shell Scripting
- [GNU Make Manual](https://www.gnu.org/software/make/manual/make.html)
- [Bash Manual](https://www.gnu.org/software/bash/manual/bash.html)

### AI Usage

**ChatGPT and GitHub Copilot** were utilized for:
- Generating Dockerfile syntax and error handling
- Structuring the README with comprehensive explanations
