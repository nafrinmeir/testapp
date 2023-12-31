# Use the official Nginx image as the base image
FROM nginx:latest

# Copy the custom index.html file
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
