# encoding: utf-8
# copyright: 2018, The Authors

title 'docker-3: docker'

host = 'ui'
port = 9292
prom_host = 'prometheus'
prom_port = 9090
user = 'travisuser'
network = 'hw-test-net'
version = 'latest'

endpoints = [
  'http://comment:9292/healthcheck',
  'http://post:5000/healthcheck',
  'http://ui:9292/healthcheck',
]

containers = [
  "docker run -d --network=#{network} --name=mongodb --network-alias=post_db --network-alias=comment_db mongo:latest",
  "docker run -d --network=#{network} --name=post #{user}/post:#{version}",
  "docker run -d --network=#{network} --name=comment #{user}/comment:#{version}",
  "docker run -d --network=#{network} -p 9292:9292 --name=ui #{user}/ui:#{version}",
  "docker run -d --network=#{network} -p 9090:9090 --name=prometheus #{user}/prometheus:#{version}",
]

msrvs = [
  'ui',
  'comment',
  'post-py',
]

monitoring = [
  'prometheus',
]

control 'docker' do
  title 'Check docker build & run'

  msrvs.each do |service|
    describe command("cd src/#{service} && USER_NAME=#{user} bash docker_build.sh") do
      its('stderr') { should eq '' }
      its('exit_status') { should eq 0 }
    end
  end

  monitoring.each do |service|
    describe command("cd monitoring/#{service} && docker build -t #{user}/prometheus .") do
      its('stderr') { should eq '' }
      its('exit_status') { should eq 0 }
    end
  end

  containers.each do |run_cmd|
    describe command(run_cmd) do
      # its('stderr') { should eq '' }
      its('exit_status') { should eq 0 }
    end
  end

  describe command('sleep 20') do
    its('exit_status') { should eq 0 }
  end

  describe command("curl http://#{host}:#{port}/new -F 'title=travis-test' -F  'link=https://travis-ci.org/'") do
    its('exit_status') { should eq 0 }
  end

  describe http("http://#{host}:#{port}/") do
    its('status') { should eq 200 }
    its('body') { should match match('Microservices Reddit in') }
  end

  describe http("http://#{prom_host}:#{prom_port}/graph") do
    its('status') { should eq 200 }
    its('body') { should match match('Prometheus Time Series Collection and Processing Server') }
  end

  describe http("http://#{prom_host}:#{prom_port}/api/v1/query?query=up") do
    its('status') { should eq 200 }
    its('body') { should match match('"status":"success"') }
  end

  endpoints.each do |url|
    describe http(url) do
      # its('status') { should eq 200 }
      its('body') { should match match('status') }
    end
  end
end
