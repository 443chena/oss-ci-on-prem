# container-mng/jenkins/Dockerfile
ARG JENKINS_IMAGE=jenkins/jenkins
ARG JENKINS_TAG=lts-jdk21
FROM ${JENKINS_IMAGE}:${JENKINS_TAG}

USER root

# Docker CLI + compose plugin (for Docker-outside-of-Docker via socket)
RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce-cli docker-compose-plugin

# Align container docker group to host docker gid (arg passed by compose)
ARG HOST_DOCKER_GID=984
RUN set -eux; \
    if getent group docker; then groupmod -g ${HOST_DOCKER_GID} docker; \
    else groupadd -g ${HOST_DOCKER_GID} docker; fi; \
    usermod -aG docker jenkins

# Java/Maven env (optional convenience)
ENV JAVA_HOME=/opt/java/openjdk
ENV M2_HOME=/opt/maven-3.9.11
ENV PATH=$M2_HOME/bin:$JAVA_HOME/bin:$PATH


COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Keep upstream entrypoint (tini -> jenkins.sh)
USER jenkins

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]