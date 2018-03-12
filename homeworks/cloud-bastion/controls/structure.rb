# encoding: utf-8
# copyright: 2018, The Authors

title 'play-travis: structure'

control 'structure' do
  title 'Check files structure'

  describe file('setupvpn.sh') do
    it { should exist }
  end

  describe file('README.md') do
    it { should exist }
  end

  describe file('cloud-bastion.ovpn') do
    it { should exist }
  end

end
