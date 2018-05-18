# encoding: utf-8
# copyright: 2018, Express42

host = 'ui'
port = 9292
user = 'travisuser'
network = 'hw-test-net'
version = 'latest'

endpoints = [
  'http://comment:9292/healthcheck',
  'http://post:5000/healthcheck',
  'http://ui:9292/healthcheck',
]

containers = [
  "docker run -d --network=#{network} --network-alias=post_db --network-alias=comment_db mongo:latest",
  "docker run -d --network=#{network} --network-alias=post #{user}/post:#{version}",
  "docker run -d --network=#{network} --network-alias=comment #{user}/comment:#{version}",
  "docker run -d --network=#{network} -p 9292:9292 --name=ui #{user}/ui:#{version}",
]

control 'docker' do
  title 'Check docker build & run'

  containers.each do |run_cmd|
    describe command(run_cmd) do
      # its('stderr') { should eq '' }
      its('exit_status') { should eq 0 }
    end
  end

  describe command('sleep 20') do
    its('exit_status') { should eq 0 }
  end

  describe host(host, port: port, protocol: 'tcp') do
    it { should be_resolvable }
    it { should be_reachable }
  end

  describe command("curl http://#{host}:#{port}/new -F 'title=travis-test' -F  'link=https://travis-ci.org/'") do
    its('exit_status') { should eq 0 }
  end

  describe http("http://#{host}:#{port}/") do
    its('status') { should eq 200 }
    its('body') { should match match('Microservices Reddit in') }
  end

  endpoints.each do |url|
    describe http(url) do
      # its('status') { should eq 200 }
      its('body') { should match match('status') }
    end
  end
end
