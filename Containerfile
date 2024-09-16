## 1. BUILD ARGS
ARG SOURCE_IMAGE="bazzite"
ARG SOURCE_INTERFIX="-asus"
ARG SOURCE_SUFFIX="-nvidia"
ARG SOURCE_TAG="stable"

### 2. SOURCE IMAGE
FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_INTERFIX}${SOURCE_SUFFIX}:${SOURCE_TAG}

### 3. MODIFICATIONS
COPY build.sh /tmp/build.sh
RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
