# encoding: utf-8
# copyright: 2018, The Authors

title 'docker-2: docker'

control 'docker' do
  title 'Check docker build'

  describe command('cd docker-monolith && docker build -t test/otus-reddit:1.0 .') do
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end

  describe command('docker run -d --name reddit --network hw-test-net test/otus-reddit:1.0') do
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end

  describe host('reddit', port: 9292, protocol: 'tcp') do
    it { should be_resolvable }
    it { should be_reachable }
  end

  describe http('http://reddit:9292/') do
    its('status') { should eq 200 }
    its('body') { should match match('Monolith Reddit') }
  end
end
