FROM openjdk:8-jdk
# 添加存储空间
VOLUME /tmp
# 拷贝运行JAR包
ADD target/test-jenkins-1.0-SNAPSHOT.jar /test.jar
# 暴露应用程序的端口
EXPOSE 8086
# 定义构建参数
ARG SPRING_PROFILES_ACTIVE
# 设置环境变量
ENV SPRING_PROFILES_ACTIVE=${SPRING_PROFILES_ACTIVE}
# 入口点， 执行JAVA运行命令
ENTRYPOINT ["java", "-Dspring.profiles.active=${SPRING_PROFILES_ACTIVE}", "-jar", "/test.jar"]


