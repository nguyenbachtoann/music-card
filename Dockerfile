# Bundle static assets with nginx
FROM nginx:1.21.0-alpine as serve
ARG NGINX_CONFIG_FOLDER
# Copy built assets from builder
# /usr/share/nginx/html is static assets destination
COPY . /usr/share/nginx/html
COPY config /config
# Add your nginx.conf
COPY $NGINX_CONFIG_FOLDER/nginx.conf /etc/nginx/conf.d/default.conf
# Expose port
EXPOSE 1209
# Start nginx
CMD ["nginx", "-g", "daemon off;"]