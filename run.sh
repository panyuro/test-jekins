docker stop  test-compose || true
docker rm  test-compose || true
docker rmi  test-compose || true
docker build -t  test-compose --build-arg SPRING_PROFILES_ACTIVE=prod .
docker run -d --name=test-compose --restart always -p 8086:8086 test-compose:latest