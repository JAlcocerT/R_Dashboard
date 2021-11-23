export IMAGE="analythium/covidapp-shiny:shiny"
export FILE="Dockerfile.shiny"
DOCKER_BUILDKIT=1 docker build --no-cache -f $FILE -t $IMAGE .
docker run -p 8080:3838 $IMAGE
