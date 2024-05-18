# Download system packages (rpm or deb) needed by 'kubeasz'
# @author:  gjmzj
# @repo:    https://github.com/easzlab/dockerfile-kubeasz-sys-pkg
# @ref:     https://github.com/easzlab/kubeasz

FROM opensuse/leap:15 as downloader

RUN set -x && \
    zypper --non-interactive install tar gzip && \
    zypper --non-interactive install --download-only \
      bash-completion \
      conntrack-tools \
      ipset \
      ipvsadm \
      libseccomp2 \
      nfs-client \
      rsync \
      socat && \
    for PKG in $(find /var/cache/zypp/packages/ -name *.rpm); do \
      mv $PKG /tmp; \
    done; \
    cd /tmp && rm -f systemd* && \
    tar zcvf /opensuse_leap_15.tgz *.rpm

# storing packages on alpine
FROM alpine:3.16

ENV SYS_PKG_VER=1.0.1

COPY --from=downloader /*.tgz /packages/

CMD [ "tail", "-f", "/dev/null" ]
