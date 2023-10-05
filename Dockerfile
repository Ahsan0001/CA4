# Use the official MySQL image as the base image
FROM mysql:latest


# Copy your custom SQL script to initialize the database (if needed)
# COPY init.sql /docker-entrypoint-initdb.d/
