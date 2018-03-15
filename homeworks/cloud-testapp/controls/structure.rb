# encoding: utf-8
# copyright: 2018, The Authors

title 'play-travis: structure'

control 'structure' do
  title 'Check files structure AND Check that last line has an newline symbol https://unix.stackexchange.com/questions/18743/whats-the-point-in-adding-a-new-line-to-the-end-of-a-file/18789#18789'

  describe file('README.md') do
    it { should exist }
  end

  describe file('install_ruby.sh') do
    it { should exist }
    it { should be_allowed('execute') }
    its('content') {should match(%r{\n\Z})}
  end

  describe file('install_mongodb.sh') do
    it { should exist }
    it { should be_allowed('execute') }
    its('content') {should match(%r{\n\Z})}
  end

  describe file('deploy.sh') do
    it { should exist }
    it { should be_allowed('execute') }
    its('content') {should match(%r{\n\Z})}
  end

  describe directory('VPN') do
    it { should exist }
  end

end
