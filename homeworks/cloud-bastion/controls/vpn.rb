# encoding: utf-8
# copyright: 2018, The Authors

title 'cloud-bastion: vpn'

configfile = file('README.md').content

describe parse_config(configfile) do
  its('bastion_IP') { should match /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/ }
end

describe parse_config(configfile) do
  its('someinternalhost_IP') { should match /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/ }
end

remotehost = parse_config(configfile).someinternalhost_IP
bastionhost = parse_config(configfile).bastion_IP

control 'vpn' do
  title 'Check OpenVPN connection to pritunl'

  describe processes('openvpn') do
    it { should exist }
  end

  describe file('/tmp/vpn-up') do
    it { should exist }
  end

  describe host(bastionhost, port: 443, protocol: 'tcp') do
    it { should be_reachable }
  end

  describe host(remotehost, port: 22, protocol: 'tcp') do
    it { should be_reachable }
  end
end







