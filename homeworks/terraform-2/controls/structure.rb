# encoding: utf-8
# copyright: 2018, The Authors

title 'terraform-2: structure'

control 'structure' do
  title 'Check repo structure'

  describe file('.gitignore') do
    it { should exist }
    its('content') { should match(%r{\n\Z}) }
  end

  describe file('README.md') do
    it { should exist }
    its('content') { should match(%r{\n\Z}) }
  end

  # Packer structure
  describe directory('packer') do
    it { should exist }
  end

    describe file('packer/ubuntu16.json') do
    it { should exist }
    its('content') { should match(%r{\n\Z}) }
  end

  describe file('packer/app.json') do
    it { should exist }
    its('content') { should match(%r{\n\Z}) }
  end

  describe file('packer/db.json') do
    it { should exist }
    its('content') { should match(%r{\n\Z}) }
  end

  describe file('packer/variables.json.example') do
    it { should exist }
    its('content') { should match(%r{\n\Z}) }
  end

  # Terraform structure
  describe directory('terraform') do
    it { should exist }
  end

  describe directory('terraform/files') do
    it { should exist }
  end

  describe directory('terraform/stage') do
    it { should exist }
  end

  describe directory('terraform/prod') do
    it { should exist }
  end

  describe directory('terraform/modules/app') do
    it { should exist }
  end

  describe directory('terraform/modules/db') do
    it { should exist }
  end

  describe directory('terraform/modules/vpc') do
    it { should exist }
  end

  describe file('terraform/storage-bucket.tf') do
    it { should exist }
    its('content') { should match(%r{\n\Z}) }
  end

  describe file('terraform/terraform.tfvars.example') do
    it { should exist }
    its('content') { should match(%r{\n\Z}) }
  end

  describe file('terraform/stage/terraform.tfvars.example') do
    it { should exist }
    its('content') { should match(%r{\n\Z}) }
  end

  describe file('terraform/prod/terraform.tfvars.example') do
    it { should exist }
    its('content') { should match(%r{\n\Z}) }
  end
end
