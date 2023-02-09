#!/bin/bash -e
now_time=$(date +%Y-%m-%d_%H-%M)
pom_a=test-jenkins
pom_v=1.0-SNAPSHOT
jar=$pom_a-$pom_v.jar
ps -ef | grep java | grep $jar | grep -v grep | awk '{print $2}' | xargs kill -9
mkdir -p jar/$now_time
wget http://localhost:8083/job/test-java-jar/8/org.example\$test-jenkins/artifact/org.example/test-jenkins/1.0-SNAPSHOT/test-jenkins-1.0-SNAPSHOT.jar -O jar/$now_time/$jar
nohup java -Dspring.profiles.active=prod -jar  jar/$now_time/$jar &
#java -Dspring.profiles.active=prod -jar test-jenkins-1.0-SNAPSHOT.jar &
test-jenkins-1.0-SNAPSHOT.jar
#sleep等待5秒后，判断线程是否存在
sleep 5
if test $(pgrep -f $jar|wc -l) -eq 0
then
   echo "Start Failed"
else
   echo "Start Success"
fi
