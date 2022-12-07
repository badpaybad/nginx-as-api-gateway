# nginx-as-api-gateway

We can use with single domain to proxy pass by part of url to each service. Design one container for run nginx only , it should work like api gate way


                    eg: your server in LAN
                    /Other/* request will forward to {ip lan}:8887
                    /TestRouting1/* request will forward to {ip lan}:8886

                    nginx as api gateway with port 80 to internet
                    proxy pass to ..:8887, ..:8886

## check file nginx.conf

                we create upstream for each container then nginx will proxy pass to them

# docker file

                    # we build and run for each upstream

                    docker build -f "Dockerfile" -t a-nginxapigateway-test .

                    docker run -it --rm -p 8886:80 --name a_nginxasapigateway_8886  a-nginxapigateway-test

                    docker run -it --rm -p 8887:80 --name a_nginxasapigateway_8887  a-nginxapigateway-test

                    docker run -it --rm -p 8888:80 --name a_nginxasapigateway_8887  a-nginxapigateway-test

                    #  we build and run for api gateway 
                    docker build -f "nginx.Dockerfile" -t a-nginxasapigateway .

                    docker run -it --rm -p 80:80 --name a-nginxasapigateway_80  a-nginxasapigateway

# The theories

                    computing unit : web, cron tab, scheduler, background job, procecss, console app ... use cpu ram to compute

                    storage unit: cache, queue, db, file eg: mysql, mongodb, redis, rabitmq, kafka ... use ram and disk to store data


It easy to scale horizontal computing unit with container, can quickly concreat by k8s ( eg scale container ) 

But the storage unit you may consider: scale up, master-slave, cluster ...



