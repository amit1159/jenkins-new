# Use Ubuntu as base image
FROM ubuntu:22.04

# Install Apache and unzip
RUN apt-get update && apt-get install -y \
    apache2 \
    unzip \
 && rm -rf /var/lib/apt/lists/*

# Copy the zip file into the container
COPY templatemo_591_villa_agency.zip /tmp/

# Unzip the template and move files to /var/www/html
RUN unzip /tmp/templatemo_591_villa_agency.zip -d /tmp/ && \
    mv /tmp/templatemo_591_villa_agency/* /var/www/html/

# Expose port 80
EXPOSE 80

# Start Apache in foreground
CMD ["apachectl", "-D", "FOREGROUND"]                                    
