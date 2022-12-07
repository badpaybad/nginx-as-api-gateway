FROM nginx:latest
RUN apt-get update -y && apt-get install -y nano

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./nginx.index.html /usr/share/nginx/html/index.html

RUN apt-get -y clean

# docker build -f "nginx.Dockerfile" -t a-nginxasapigateway .
# docker run -it --rm -p 80:80 --name a-nginxasapigateway_80  a-nginxasapigateway
