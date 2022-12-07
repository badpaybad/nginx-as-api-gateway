#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.
#FROM ubuntu:focal
FROM mcr.microsoft.com/dotnet/aspnet:6.0-focal AS base
#RUN cat /etc/os-release

RUN apt-get update -y && apt-get install -y nano \
    apt-transport-https ca-certificates software-properties-common \
    libfontconfig1 libfreetype6     


WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0-focal AS build

WORKDIR /src 
COPY ["/nginxapigateway/", "nginxapigateway/"]

RUN dotnet restore "./nginxapigateway/nginxapigateway.csproj"

WORKDIR "/src/."
RUN dotnet build "nginxapigateway/nginxapigateway.csproj" -c Release --runtime linux-x64 -o /app/build

FROM build AS publish
RUN dotnet publish "nginxapigateway/nginxapigateway.csproj" -c Release --runtime linux-x64 -o /app/publish

#
FROM base AS final
WORKDIR /app

COPY --from=publish /app/publish .

RUN apt-get -y clean

RUN chmod -R 777 /app

#http
EXPOSE 5000 
EXPOSE 80 
#ENV ASPNETCORE_URLS=http://*:5000

CMD ["dotnet", "nginxapigateway.dll"]

# docker build -f "Dockerfile" -t a-nginxapigateway-test .

# docker run -it --rm -p 8886:80 --name a_nginxasapigateway_8886  a-nginxapigateway-test

# docker run -it --rm -p 8887:80 --name a_nginxasapigateway_8887  a-nginxapigateway-test

# docker run -it --rm -p 8888:80 --name a_nginxasapigateway_8887  a-nginxapigateway-test