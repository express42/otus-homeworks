# encoding: utf-8
# copyright: 2018, The Authors

title 'packer validation'

control 'packer' do
  impact 1
  title 'Run packer validate'

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

  describe file('ansible/packer_app.yml') do
    it { should exist }
    its('content') { should match(%r{\n\Z}) }
  end

  describe file('ansible/packer_db.yml') do
    it { should exist }
    its('content') { should match(%r{\n\Z}) }
  end

  describe command('packer validate -var-file=packer/variables.json.example packer/app.json') do
    its('stdout') { should eq "Template validated successfully.\n" }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end

  describe command('packer validate -var-file=packer/variables.json.example packer/db.json') do
    its('stdout') { should eq "Template validated successfully.\n" }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end
end
