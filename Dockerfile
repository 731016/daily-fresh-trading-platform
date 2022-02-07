# 使用官方 maven/Java 8 镜像作为构建环境
# https://hub.docker.com/_/maven
FROM maven:3.6-jdk-11

# 将 jar 放入容器内
COPY /app/target/spring_mvc-1.0-SNAPSHOT.jar /spring_mvc.jar

# 启动服务
CMD ["java", "-jar", "/spring_mvc.jar"]