FROM nginx:latest
ADD nginx.conf /etc/nginx/nginx.conf
ADD start.sh /app/start.sh
WORKDIR /app/
CMD /bin/sh start.sh
