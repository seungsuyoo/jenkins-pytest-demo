# Jenkins LTS (JDK17)
FROM jenkins/jenkins:lts-jdk17

USER root

# Python/Chromium 설치
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      python3 python3-pip python3-venv \
      chromium chromium-driver \
      ca-certificates curl git && \
    rm -rf /var/lib/apt/lists/*

# 가상환경 만들고 그 안에 패키지 설치
RUN python3 -m venv /opt/venv \
 && /opt/venv/bin/pip install --no-cache-dir --upgrade pip \
 && /opt/venv/bin/pip install --no-cache-dir pytest selenium

# Jenkins 유저가 쓸 수 있게 권한/경로 설정
RUN chown -R jenkins:jenkins /opt/venv
ENV PATH="/opt/venv/bin:${PATH}"
ENV CHROME_BIN=/usr/bin/chromium
ENV CHROMEDRIVER_PATH=/usr/lib/chromium/chromedriver

USER jenkins
