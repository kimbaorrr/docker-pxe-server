FROM alpine:latest

# Install the necessary packages
RUN apk add --no-cache dnsmasq

WORKDIR /tmp

RUN \
  mkdir -p /var/lib/tftpboot \
  && ln -s /var/lib/tftpboot /tftpboot

# Configure DNSMASQ
COPY etc/ /etc

VOLUME ["/tftpboot"]

# Start dnsmasq. It picks up default configuration from /etc/dnsmasq.conf and
# /etc/default/dnsmasq plus any command line switch
ENTRYPOINT ["dnsmasq", "--no-daemon"]
