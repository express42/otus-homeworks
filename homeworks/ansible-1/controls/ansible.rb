# encoding: utf-8
# copyright: 2018, The Authors

title 'ansible validation'

control 'ansible' do
  impact 1
  title 'Run packer validate'

  describe file('ansible/clone.yml') do
    it { should exist }
  end

  describe command('cd ansible && ansible-playbook --syntax-check clone.yml') do
    its('stdout') { should match "playbook: clone.yml" }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end
end
