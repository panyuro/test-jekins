# 构建镜像的文件
# 执行脚本：docker build --build-arg JAR_FILE="test-jenkins-1.0-SNAPSHOT.jar" --build-arg SPRING_PROFILES_ACTIVE=dev --build-arg LOG_OUTPUT=/dev/null -t test-jenkins .

FROM openjdk:8-jdk
# 添加存储空间
VOLUME /home/sith/deploy/backend/app

# 定义构建参数
ARG JAR_FILE
ARG SPRING_PROFILES_ACTIVE=sithMesTest
ARG LOG_OUTPUT=/dev/null

# 复制构建好的 JAR 文件到容器中
COPY ${JAR_FILE} /app.jar

## 设置环境变量
ENV SPRING_PROFILES_ACTIVE=${SPRING_PROFILES_ACTIVE}
# 入口点， 执行JAVA运行命令
ENTRYPOINT ["nohup","java", "-Dspring.profiles.active=${SPRING_PROFILES_ACTIVE}", "-jar", "/app.jar",">${LOG_OUTPUT} 2>&1 &"]
#ENTRYPOINT ["sh", "-c", "nohup java -Dspring.profiles.active=${SPRING_PROFILES_ACTIVE} -jar /app.jar >/dev/null 2>&1 &"] 失败的场景测试
