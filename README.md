# dnscryptproxy
Docker image to run DNS Crypt Proxy

## Examples

docker run -it --rm -p <IP>:53:53/tcp -p <IP>:53:53/udp --name dns cauan/dnscryptproxy

### Use cloacking rules to set DNS entries
docker run -it --rm -p 0.0.0.0:53:53/tcp -p 0.0.0.0:53:53/udp -v /etc/dnscrypt-proxy/cloaking-rules.txt:/etc/dnscrypt-proxy/cloaking-rules.txt --name dns cauan/dnscryptproxy