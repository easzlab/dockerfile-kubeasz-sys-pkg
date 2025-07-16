# Download system packages (rpm or deb) needed by 'kubeasz'
# @author:  gjmzj
# @repo:    https://github.com/easzlab/dockerfile-kubeasz-sys-pkg
# @ref:     https://github.com/easzlab/kubeasz

FROM almalinux:8 as downloader

RUN yum install --downloadonly --downloaddir=/root/down -y \
      bash-completion \
      conntrack-tools \
      ipset \
      ipvsadm \
      libseccomp \
      lvm2 \
      nfs-utils \
      rsync \
      socat && \
    cd /root/down && rm -f systemd* && \
    tar zcvf /tmp/almalinux_8.tgz *.rpm

# storing packages on alpine
FROM alpine:3.16

ENV SYS_PKG_VER=1.0.1

COPY --from=downloader /tmp/*.tgz /packages/

CMD [ "tail", "-f", "/dev/null" ]
