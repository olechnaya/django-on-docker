FROM nginx:1.25
WORKDIR /etc/nginx/
RUN rm /etc/nginx/conf.d/default.conf
COPY hello_django.conf /etc/nginx/conf.d
RUN rm -f /var/log/nginx/*
EXPOSE 80
