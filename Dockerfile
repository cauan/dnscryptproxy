FROM alpine:latest

RUN apk add --update --no-cache dnscrypt-proxy openrc vim curl bash 

# Update default settings
RUN sed -i 's/force_tcp = false/force_tcp = true/' /etc/dnscrypt-proxy/dnscrypt-proxy.toml
RUN sed -i 's/skip_incompatible = false/skip_incompatible = true/' /etc/dnscrypt-proxy/dnscrypt-proxy.toml
RUN sed -i "s/^listen_addresses = \['127.0.0.1:53'\]/listen_addresses = ['0.0.0.0:53']/" /etc/dnscrypt-proxy/dnscrypt-proxy.toml
RUN sed -i "s/^# cloaking_rules = /cloaking_rules = /" /etc/dnscrypt-proxy/dnscrypt-proxy.toml
RUN echo > /etc/dnscrypt-proxy/cloaking-rules.txt

# Expose DNSCrypt port
EXPOSE 53/udp

ENTRYPOINT ["dnscrypt-proxy", "-config", "/etc/dnscrypt-proxy/dnscrypt-proxy.toml"]
