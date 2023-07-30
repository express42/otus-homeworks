# encoding: utf-8
# copyright: 2018, The Authors

title 'packer validation'

control 'packer' do
  impact 1
  title 'Run packer validate'

  describe file('packer/ubuntu16.pkr.hcl') do
    it { should exist }
    its('content') { should match(%r{\n\Z}) }
  end

  describe file('packer/app.pkr.hcl') do
    it { should exist }
    its('content') { should match(%r{\n\Z}) }
  end

  describe file('packer/db.pkr.hcl') do
    it { should exist }
    its('content') { should match(%r{\n\Z}) }
  end

  describe file('packer/variables.pkr.hcl.example') do
    it { should exist }
    its('content') { should match(%r{\n\Z}) }
  end

  describe command('cd packer && packer validate -var-file=variables.pkr.hcl.example ubuntu16.pkr.hcl') do
    its('stdout') { should eq "The configuration is valid.\n" }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end

  describe command('cd packer && packer validate -var-file=variables.pkr.hcl.example app.pkr.hcl') do
    its('stdout') { should eq "The configuration is valid.\n" }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end

  describe command('cd packer && packer validate -var-file=variables.pkr.hcl.example db.pkr.hcl') do
    its('stdout') { should eq "The configuration is valid.\n" }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end
end
