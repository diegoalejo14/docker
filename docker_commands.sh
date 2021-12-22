## Create Docker
docker build -t  platziapp .
docker run --rm -p 3000:3000 platziapp
docker run -d --name db mongo
docker network create --attachable platzinet
docker network connect platzinet db
docker run -d --name app -p 3000:3000 --env MONGO_URL=mongodb://db:27017/test platziapp
docker network connect platzinet app

#Docker in docker

docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock docker:19.03.12 
# docker ps
# docker run -d --name app prodapp