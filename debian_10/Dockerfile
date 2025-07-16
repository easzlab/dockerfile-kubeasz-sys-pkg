# Download system packages (rpm or deb) needed by 'kubeasz'
# @author:  gjmzj
# @repo:    https://github.com/easzlab/dockerfile-kubeasz-sys-pkg
# @ref:     https://github.com/easzlab/kubeasz

FROM debian:10 as downloader

RUN echo "deb http://archive.debian.org/debian buster main" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian buster-updates main" >> /etc/apt/sources.list && \
    apt update && \
    apt install -d -y \
      conntrack \
      ipset \
      ipvsadm \
      jq \
      libseccomp2 \
      lvm2 \
      nfs-common \
      rsync \
      socat && \
    cd /var/cache/apt/archives && \
    tar zcvf /tmp/debian_10.tgz *.deb

# storing packages on alpine
FROM alpine:3.16

ENV SYS_PKG_VER=1.0.1

COPY --from=downloader /tmp/*.tgz /packages/

CMD [ "tail", "-f", "/dev/null" ]
