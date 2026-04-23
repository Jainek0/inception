# User Documentation

## Services Provided
This project provides various services that can be utilized for managing and accessing system functionalities. 

## Starting and Stopping the Project
To start the project, run the command:

1. **Clone the repository:**
   ```bash
   git clone <inception@42>
   cd inception
   ```

2. **Build and Start:**
   ```bash
   make
   ```

3. **Stop inception:**
   ```bash
   make down
   ```

4. **Reset services and start:**
   ```bash
   make re
   ```
5. **Remove persistent memory:**
   ```bash
   make fclean
   ```

5. **Before uninstall:**
   ```bash
   make sfclean
   ```

## Accessing the Website and Admin Panel
You can access the website at `http://yourdomain.com`. For the admin panel, navigate to `http://yourdomain.com/admin`.

## Managing Credentials
Credentials can be managed through the config file located at `.env`. Please ensure that sensitive information is kept secure.
```bash
 nano ~/inception/srcs/.env
```
```bash
DB_NAME=""
DB_USER=""
DB_PASSWORD=""
DB_ADMIN_PASS=""
DOMAIN_NAME=""

WP_ADMIN_USER=""
WP_ADMIN_PASS=""
WP_ADMIN_MAIL=""

WP_USER=""
WP_PASS=""
WP_MAIL=""
```

## Checking Running Services
To check if the services are running correctly, use the following command:
  ```bash
  docker ps
  ```

This will provide you with the status of all active services.
