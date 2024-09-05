FROM fedora:40
LABEL org.opencontainers.image.authors="paulej@terrapane.com"
LABEL org.opencontainers.image.description="Docker-Based Private Build Container"
LABEL org.opencontainers.image.source="https://github.com/terrapane/aescrypt_private_build.git"
LABEL org.opencontainers.image.licenses="Commercial"

RUN dnf -y update --refresh && \
    dnf -y install git gcc gcc-c++ clang clang-devel clang-tools-extra \
           make cmake findutils diffutils debbuild rpmdevtools libatomic \
           libatomic-static libstdc++-static glibc-static

COPY bin/perform_build /usr/bin/perform_build
WORKDIR /source
