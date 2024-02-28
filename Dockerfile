FROM alpine:latest

# Install the necessary packages
RUN apk add --no-cache \
  dnsmasq \
  wget

WORKDIR /tmp

RUN \
  mkdir -p /var/lib/tftpboot

# Configure PXE and TFTP
COPY tftpboot/ /var/lib/tftpboot

# Configure DNSMASQ
COPY etc/ /etc

# Start dnsmasq. It picks up default configuration from /etc/dnsmasq.conf and
# /etc/default/dnsmasq plus any command line switch
ENTRYPOINT ["dnsmasq", "--no-daemon"]
CMD ["--dhcp-range=192.168.1.2,proxy"]
