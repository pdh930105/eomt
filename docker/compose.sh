export USERID=$(id -u)
export GROUPID=$(id -g)
export USERNAME=$(whoami)
export CONTAINERNAME=${1:-pdh_eomt}
export COMPOSE_PROJECT_NAME=${2:-pdh_eomt}
printf "USERID=%s\n" $USERID 
printf "GROUPID=%s\n" $GROUPID 
printf "USERNAME=%s\n" $USERNAME
printf "CONTAINERNAME=%s\n" $CONTAINERNAME 
xhost +
xhost +local:docker
echo $xhost
docker compose down
docker compose up -d --build --remove-orphans
docker compose exec echo $xhost
docker exec -it $CONTAINERNAME /bin/bash
