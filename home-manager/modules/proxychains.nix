{ config, lib, ... }:

{
  # Proxychains configuration
  environment.etc."proxychains.conf".text = ''
    strict_chain
    quiet_mode = no
    proxy_dns
    [ProxyList]
    socks4 127.0.0.1 9050
    http 127.0.0.1 8080
    http 127.0.0.1 8081
  '';
}