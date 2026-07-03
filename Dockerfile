# ABC Technologies — static site container
# Base image: nginx (lightweight, purpose-built for serving static files)
FROM nginx:alpine

# Remove nginx's default sample site
RUN rm -rf /usr/share/nginx/html/*

# Copy our website files into nginx's web root
COPY index.html about.html services.html careers.html gallery.html contact.html /usr/share/nginx/html/
COPY css/ /usr/share/nginx/html/css/
COPY js/ /usr/share/nginx/html/js/
COPY images/ /usr/share/nginx/html/images/

# nginx listens on port 80 by default
EXPOSE 80

# Base image already starts nginx in the foreground — no CMD override needed
