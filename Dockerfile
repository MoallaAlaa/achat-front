ROM nginx:alpine
COPY dist/crudtuto-Front /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf