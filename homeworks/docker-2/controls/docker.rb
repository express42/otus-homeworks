# encoding: utf-8
# copyright: 2018, The Authors

title 'docker-2: docker'

host = 'reddit'
port = 9292

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

  describe command('sleep 15') do
    its('exit_status') { should eq 0 }
  end

  describe host('reddit', port: 9292, protocol: 'tcp') do
    it { should be_resolvable }
    it { should be_reachable }
  end

  describe command("curl http://#{host}:#{port}/signup -F 'username=travis' -F  'password=travis'") do
    its('exit_status') { should eq 0 }
  end

  describe command("curl http://#{host}:#{port}/new -F 'title=travis-test' -F  'link=https://travis-ci.org/'") do
    its('exit_status') { should eq 0 }
  end

  describe http("http://#{host}:#{port}/") do
    its('status') { should eq 200 }
    its('body') { should match match('Monolith Reddit') }
  end
end
