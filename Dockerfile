FROM nginx:latest
RUN apt-get update -qq -y
RUN apt-get install -qq -y ca-certificates
RUN apt-get install -qq -y curl


ADD bin/ /usr/local/bin/
RUN chmod +x /usr/local/bin/consul
RUN chmod +x /usr/local/bin/consul-template

ADD consul.d/ /etc/consul.d/

#ADD web.conf /etc/nginx/sites-enabled/default
ADD web.conf.ctmpl /tmp/web.conf.ctmpl
ADD nginx.conf /etc/nginx/nginx.conf
ADD start.sh /app/start.sh
WORKDIR /app/
CMD /bin/sh start.sh
