# encoding: utf-8
# copyright: 2018, The Authors

title 'ansible-1: structure'

control 'structure' do
  title 'Check repo structure'

  describe file('.gitignore') do
    it { should exist }
    its('content') {should match(%r{\n\Z})}
  end

  describe file('README.md') do
    it { should exist }
    its('content') {should match(%r{\n\Z})}
  end

  describe directory('ansible') do
    it { should exist }
  end

  describe file('ansible/requirements.txt') do
    it { should exist }
    its('content') {should match(%r{\n\Z})}
  end

   describe file('ansible/ansible.cfg') do
    it { should exist }
    its('content') {should match(%r{\n\Z})}
  end

  describe file('ansible/clone.yml') do
    it { should exist }
    its('content') {should match(%r{\n\Z})}
  end

  describe file('ansible/inventory') do
    it { should exist }
    its('content') {should match(%r{\n\Z})}
  end

  describe file('ansible/inventory.yml') do
    it { should exist }
    its('content') {should match(%r{\n\Z})}
  end
end
