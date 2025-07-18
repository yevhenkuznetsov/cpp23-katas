FROM ubuntu:noble

LABEL org.opencontainers.image.source=https://github.com/yevhenkuznetsov/cpp-devcontainer
LABEL org.opencontainers.image.description="Development container for the modern C++ project"
LABEL org.opencontainers.image.licenses="MIT license"

ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ=Etc/UTC

COPY apt-packages.in /tmp/apt.in
RUN apt update && \
    grep -vE '^\s*#' /tmp/apt.in | xargs apt install --no-install-recommends -y && \
    rm -rf /var/lib/apt/lists/* && apt-get clean -y && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en

ARG TARGETARCH=amd64
ARG BAZELISK_VERSION=v1.26.0
ARG BUILDIFIER_VERSION=v8.2.1
RUN curl -f -L -o /usr/local/bin/bazelisk \
        https://github.com/bazelbuild/bazelisk/releases/download/${BAZELISK_VERSION}/bazelisk-linux-${TARGETARCH} && \
    chmod +x /usr/local/bin/bazelisk && \
    ln -s /usr/local/bin/bazelisk /usr/local/bin/bazel && \
    curl -f -L -o /usr/local/bin/buildifier \
        https://github.com/bazelbuild/buildtools/releases/download/${BUILDIFIER_VERSION}/buildifier-linux-${TARGETARCH} && \
    chmod +x /usr/local/bin/buildifier

COPY .clang-format /.clang-format
COPY .clang-tidy /.clang-tidy
COPY .clangd /.clangd

ARG CONTAINER_USER=developer
ARG WORKSPACE_FOLDER=/workspace
RUN useradd -s /bin/bash -m ${CONTAINER_USER} && \
    usermod -a -G video ${CONTAINER_USER} && \
    echo "\nexport PROMPT_COMMAND=\"history -a; history -n\n\"" >> /home/${CONTAINER_USER}/.bashrc && \
    echo "ALL ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    mkdir ${WORKSPACE_FOLDER} && chown ${CONTAINER_USER}:${CONTAINER_USER} ${WORKSPACE_FOLDER}

USER ${CONTAINER_USER}
