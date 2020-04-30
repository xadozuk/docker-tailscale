FROM ubuntu:18.04

MAINTAINER Xadozuk <xadozuk@gmail.com>

RUN apt-get update && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get install -y iptables iproute2 ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV VERSION=0.98-0
ENV ARCH=amd64

ADD https://pkgs.tailscale.com/stable/tailscale_${VERSION}_${ARCH}.tgz /tailscale.tgz
RUN mkdir /tailscale && tar xzf /tailscale.tgz -C /tailscale --strip-components 1

CMD ["/tailscale/tailscaled"]
