# encoding: utf-8
# copyright: 2018, The Authors

title 'cloud-testapp: deploy'

control 'Check README.md' do

  describe file('README.md') do
    its('content') { should match /\s*testapp_IP\s*=\s*((?:(?:25[0-5]|2[0-4]\d|[0-1]\d{2}|\d{1,2})\.){3}(?:25[0-5]|2[0-4]\d|[0-1]\d{2}|\d{1,2}))\s{0,2}$/m }
    its('content') { should match /\s*testapp_port\s*=\s*(6553[0-5]|655[0-2]\d|65[0-4]\d{2}|6[0-4]\d{3}|[1-5]\d{4}|[1-9]\d{0,3})\s{0,2}$/m }

  end
end

testapphost = File.read('README.md').match(/\s*testapp_IP\s*=\s*((?:(?:25[0-5]|2[0-4]\d|[0-1]\d{2}|\d{1,2})\.){3}(?:25[0-5]|2[0-4]\d|[0-1]\d{2}|\d{1,2}))\s{0,2}$/m)[1]
testappport = File.read('README.md').match(/\s*testapp_port\s*=\s*(6553[0-5]|655[0-2]\d|65[0-4]\d{2}|6[0-4]\d{3}|[1-5]\d{4}|[1-9]\d{0,3})\s{0,2}$/m)[1]

control 'Configuration' do
  title 'Check testapp installation scenarios'

  %w(ruby-full ruby-bundler build-essential mongodb-org).each do |pkg|
      describe package(pkg) do
        it { should be_installed }
    end
  end

  describe service('mongod') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(27017) do
    it { should be_listening }
    its('protocols') { should include 'tcp' }
    its('processes') { should include 'mongod' }
  end

  describe port(testappport) do
    it { should be_listening }
    its('protocols') { should include 'tcp' }
    its('processes') { should include 'ruby2.3' }
  end

end

control 'Reddit-APP' do
  title 'Check testapp web-application'

  describe host(testapphost, port: testappport, protocol: 'tcp') do
    it { should be_reachable }
  end

  describe command("curl http://#{testapphost}:#{testappport}/signup -F 'username=travis' -F  'password=travis'") do
    its('exit_status') { should eq 0 }
  end

  describe command("curl http://#{testapphost}:#{testappport}/new -F 'title=travis-test' -F  'link=https://travis-ci.org/'") do
    its('exit_status') { should eq 0 }
  end

  describe http("http://#{testapphost}:#{testappport}/") do
      its('status') { should eq 200 }
      its('body') { should match match(%r{href\='https:\/\/travis-ci\.org\/'}) }
  end
end
