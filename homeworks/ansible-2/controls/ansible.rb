# encoding: utf-8
# copyright: 2018, The Authors

title 'ansible validation'

control 'ansible' do
  impact 1
  title 'Run ansible validation'

  describe command('find ansible ! -name "inventory*.yml" -name "*.yml" -type f -print0 | xargs -0 -n1 ansible-playbook --syntax-check') do
    its('stderr') { should_not match (/The error appears to have been/) }
    its('exit_status') { should eq 0 }
  end
end
