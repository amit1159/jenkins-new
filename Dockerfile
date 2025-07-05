# Use Ubuntu as base image
FROM ubuntu:22.04

# Install Apache and unzip
RUN apt-get update && apt-get install -y \
    apache2 \
    unzip \
 && rm -rf /var/lib/apt/lists/*

# Copy the zip file into the container
COPY templatemo_589_lugx_gaming.zip /tmp/

# Unzip the template and move files to /var/www/html
RUN unzip /tmp/templatemo_589_lugx_gaming.zip -d /tmp/ && \
    mv /tmp/templatemo_589_lugx_gaming/* /var/www/html/

# Expose port 80
EXPOSE 80

# Start Apache in foreground
CMD ["apachectl", "-D", "FOREGROUND"]                                    
