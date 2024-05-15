# jenkins + docker :通过将指定jar包构建成镜像，再通过镜像运行容器的方式，启动微服务
# 代码更新时：停止当前的容器，重新使用最新的jar包构建镜像，后面重新执行构建镜像，启动微服务
# 执行脚本：sh jenkins-run.sh test-jenkins 8086 prod

BUILD_ID=dontKillMe
CURRENT_TIMESTAMP=$(date +%s)
NOW=$(date -d @$CURRENT_TIMESTAMP "+%Y-%m-%d_%H-%M-%S")
jar=$1-1.0.0-SNAPSHOT.jar
cp $jar $1-$NOW.jar
jar=$(ls $1*.jar | sort -r | head -n 1)
echo $jar
docker stop  $1 || true
docker rm  $1 || true
docker rmi  $1 || true
docker build --build-arg JAR_FILE="$jar" --build-arg SPRING_PROFILES_ACTIVE=$3 --build-arg LOG_OUTPUT=$4 -t $1 .
docker run -d --name=$1 --restart always -p $2:$2 $1:latest
sleep 30
if docker ps -f name=test-jenkins --format '{{.Status}}' | grep -q 'Up'; then
   echo "Container test-jenkins is running"
else
   echo "Container test-jenkins is not running"
fi
echo '================================== 执行 docker ps ========================'
docker ps