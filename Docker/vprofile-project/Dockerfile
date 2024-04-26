# Use the official MySQL image from Docker Hub
FROM mysql:latest

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=drishifo
ENV MYSQL_DATABASE=accounts
ENV MYSQL_USER=akash
ENV MYSQL_PASSWORD=drishifo

# Copy SQL scripts to initialize the database (optional)
ADD db_backup.sql docker-entrypoint-initdb.d/db_backup.sql
# Expose the MySQL port
EXPOSE 3306

# Start MySQL server
CMD ["mysqld"]
