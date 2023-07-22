# encoding: utf-8
# copyright: 2018, The Authors

title 'terraform-1: structure'

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

  describe directory('packer') do
    it { should exist }
  end

  describe file('packer/variables.pkr.hcl.example') do
    it { should exist }
    its('content') {should match(%r{\n\Z})}
  end

  describe directory('terraform') do
    it { should exist }
  end

  describe directory('terraform/files') do
    it { should exist }
  end

  describe file('terraform/terraform.tfvars.example') do
    it { should exist }
    its('content') {should match(%r{\n\Z})}
  end
end
