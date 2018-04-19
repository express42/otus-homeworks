# encoding: utf-8
# copyright: 2018, The Authors

title 'docker-1: docker'

control 'docker' do
  title 'Check docker-1.log content'

  describe file('docker-monolith/docker-1.log') do
    it { should exist }
    its('content') { should include 'REPOSITORY' }
    its('content') { should include 'TAG' }
    its('content') { should include 'IMAGE ID' }
    its('content') { should include 'CREATED' }
    its('content') { should include 'SIZE' }
    its('content') { should include '/ubuntu-tmp-file' }
  end
end
