function vpn -d 'Setups up VPN Connection'
  sudo openvpn /etc/openvpn/ovpn_tcp/$argv.nordvpn.com.tcp.ovpn
end
