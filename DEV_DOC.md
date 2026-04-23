# Developer Documentation

This document describes how to set up the environment from scratch, build and launch the project using Makefile and Docker Compose, manage containers and volumes, and identify where the project data is stored and how it persists.

## Setting up the Environment

1. **Clone the Repository**
   ```bash
   git clone <inception@42>
   cd inception
   ```

2. **Install Prerequisites**
   Ensure you have Docker and Docker Compose installed on your machine.

## Building and Launching the Project

1. **Build the Project**
   Use the Makefile to build the project by running:
   ```bash
   docker build
   ```

2. **Launch the Project**
   Use Docker Compose to start the services:
   ```bash
   docker-compose up
   ```

## Managing Containers and Volumes

- To stop the services, run:
  ```bash
  docker-compose down
  ```
  
- To list running containers:
  ```bash
  docker ps
  ```
  
- To debug containers:
  ```bash
  docker log <containers_name>
  ```
  
- To manegement containers:
  ```bash
  docker -it <containers_name> bash
  ```

- To remove a volume, use:
  ```bash
  docker volume rm <volume_name>
  ```

## Identifying Project Data Persistence

The project data is stored in Docker volumes. You can inspect your volumes using:
```bash
docker volume ls
```



### Conclusion
Following the above steps will set up the environment and ensure your project runs smoothly.
