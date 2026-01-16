FROM nginx:alpine

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy our app
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# nginx runs by default
CMD ["nginx", "-g", "daemon off;"]
