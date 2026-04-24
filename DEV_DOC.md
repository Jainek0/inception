# Developer Documentation

This document describes how to set up the environment from scratch, build and launch the project using Makefile and Docker Compose, manage containers and volumes, and identify where the project data is stored and how it persists.

## Setting up the Environment

1. **Install Prerequisites**
   Ensure you have Docker and Docker Compose installed on your machine :
   https://docs.docker.com/engine/install/debian/

2. **Clone the Repository**
   ```bash
   git clone <inception@42>
   ```

3. **Docker compose**
  This is where our dockers can work in harmony. We configurate what where when each docker begin and how it interact and communicate with other.
  ```yaml
  version: "3.8"
  ```

  ```yaml
  placeholder = nginx or wordpress or mariadb
    services:
      placeholder:
        container_name: placeholder
        build: requirements/placeholder
        env_file:
          - .env
        ports(nginx):
          - "443:443"
        volumes:
          - wordpress:/var/www/html
        depends_on(nginx / wordpress):
          - wordpress / mariadb
        networks:
          - inception
        restart: on-failure
        pull_policy: never
  ```
  ```yaml
    networks:
      inception:
        name: inception
        driver: bridge
  ```

  ```yaml
    volumes:
      wordpress:
        driver: local
        driver_opts:
          type: none
          device: /home/thcaquet/data/wordpress
          o: bind

      mariadb:
        driver: local
        driver_opts:
          type: none
          device: /home/thcaquet/data/mariadb
            o: bind
   ```

   Credentials can be managed through the config file located at `.env`. Please ensure that sensitive information is kept secure.
    ```bash
    nano ~/inception/srcs/.env
    ```

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
