# encoding: utf-8
# copyright: 2018, The Authors

title 'packer validation'

control 'packer' do
  impact 1
  title 'Run packer validate'

  files = [
    'packer/app.json',
    'packer/db.json',
    'packer/variables.json.example',
    'ansible/playbooks/packer_app.yml',
    'ansible/playbooks/packer_db.yml',
  ]

  files.each do |path|
    describe file(path) do
      it { should exist }
      its('content') { should match(%r{\n\Z}) }
    end
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
