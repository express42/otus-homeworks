# encoding: utf-8
# copyright: 2018, The Authors

title 'play-travis: structure'

control 'structure' do
  title 'Check files structure that last line has a newline symbol https://cifronomika.ru/blog/git-no-newline-at-end-of-file.html - Explanation '

  describe file('setupvpn.sh') do
    it { should exist }
    its('content') {should match(%r{\n\Z})}
  end

  describe file('README.md') do
    it { should exist }
    its('content') {should match(%r{\n\Z})}
  end

  describe file('cloud-bastion.ovpn') do
    it { should exist }
  end

end
