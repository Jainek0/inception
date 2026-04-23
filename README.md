# Inception

*This project has been created as part of the 42 curriculum by Jainek0*

## Description
This project aims to provide an immersive introduction into containerization through Docker. It is part of the 42 curriculum which emphasizes modern software development practices and the importance of understanding the underlying technologies that drive todays applications.

## Instructions
To get started with this project:
1. **Compilation:** Run `make` in the terminal to compile the project.
2. **Installation:** Ensure you have Docker installed and configured on your machine.
3. **Execution:** Use `docker-compose up` to start the project.

## Resources
- [Docker Official Documentation](https://docs.docker.com/)
- [Understanding Docker vs VMs](https://example.com/docker-vs-vms)
- AI Tools: Utilized AI for code reviews and optimization suggestions.

## Project Description
### Docker Usage
Docker is used to encapsulate the application and its dependencies, ensuring consistency across various environments. 

### Design Choices
The design of this project focuses on modularity and scalability. We have opted for a microservices architecture as it allows for independent scaling and development of distinct components.

### Comparisons
- **Virtual Machines vs Docker:** VMs run a full OS, whereas Docker uses the host OS, making it lightweight. 
- **Secrets vs Environment Variables:** Secrets are stored in Docker’s secret management, while environment variables pass configuration details without secret management.
- **Docker Network vs Host Network:** Docker Network provides isolation whereas Host Network shares the host’s networking stack.
- **Docker Volumes vs Bind Mounts:** Volumes are managed by Docker and stored in a part of the host file system, while bind mounts are linked to directories on the host file system directly.
