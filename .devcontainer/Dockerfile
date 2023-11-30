# Node.js v14 Alpine 이미지를 가져옵니다.
FROM openjdk:11-jre-slim

LABEL org.opencontainers.image.source=https://github.com/ATG-AMS/dh-api-dev


# git과 curl을 설치합니다.
RUN apt-get update && apt-get install -y curl git

# 스크립트를 복사합니다.
COPY script.sh /scripts/script.sh

# 스크립트를 실행 가능하도록 설정합니다.
RUN chmod +x /scripts/script.sh

# 작업 디렉토리를 설정합니다.
WORKDIR /app

# HEALTHCHECK를 설정합니다.
HEALTHCHECK --interval=1m --timeout=5s --retries=5 CMD curl -f http://localhost:8080/api/v1/front/health || exit 1

# 외부에서 접근 가능한 포트를 엽니다.
EXPOSE 8080

# 컨테이너가 시작될 때 스크립트를 실행합니다.
CMD [ "sh", "/scripts/script.sh" ]
