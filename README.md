# Tip command
```bash
# Init docker vm
docker machine init
docker machine start

# Build image and run container
docker build -t localhost/apache-ubuntu .
docker run -it --name apache-ubuntu -d localhost/apache-ubuntu
docker run -it --name apache-ubuntu -d -p 8080:80 localhost/apache-ubuntu
docker exec -it apache-ubuntu bash
curl http://localhost:8080

# Push image to ACR
docker tag localhost/apache-ubuntu auoplatform.azurecr.io/apache-ubuntu:latest
docker push auoplatform.azurecr.io/apache-ubuntu:latest

# Diag
docker logs apache-ubuntu

# Delete container
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)

# Delete images
docker rmi -f $(docker images -a -q)
docker rmi -f $(docker images -f "dangling=true" -q)
```