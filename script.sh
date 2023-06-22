#!/bin/bash

# 사용자로부터 깃허브 토큰 정보를 읽어옵니다.
USER_ID=${USER_ID}
USER_EMAIL=${USER_EMAIL}
GITHUB_TOKEN=${GITHUB_TOKEN}
GITHUB_REPOSITORY="github.com/ATG-AMS/donghae-api-server.git"

# '/app' 내에 'donghae-api-server' 디렉토리를 만들고, 그곳에 레포지토리를 클론합니다.
git clone https://${USER_ID}:${GITHUB_TOKEN}@${GITHUB_REPOSITORY} /app/donghae-api-server --config core.askPass=true

# 작업 디렉토리를 '/app/donghae-api-server'으로 변경합니다.
cd /app/donghae-api-server

# 사용자 정보를 설정합니다.
git config user.name ${USER_ID}
git config user.email ${USER_EMAIL}

# branch 를 stage branch로 변경합니다.
git checkout stg

# 레포지토리의 원격 저장소를 변경합니다.
git remote set-url origin https://${GITHUB_TOKEN}@${GITHUB_REPOSITORY}

# 무한 루프를 실행하여 컨테이너를 계속 실행 상태로 유지합니다.
tail -f /dev/null
