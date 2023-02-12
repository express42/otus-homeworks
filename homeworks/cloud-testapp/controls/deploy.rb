# encoding: utf-8
# copyright: 2018, The Authors

title 'cloud-testapp: deploy'

control 'Check README.md' do

  describe parse_config_file('README.md') do
    its('testapp_IP') { should match /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/ }
  end
  
  describe parse_config_file('README.md') do
    its('testapp_port') { should match /^()([1-9]|[1-5]?[0-9]{2,4}|6[1-4][0-9]{3}|65[1-4][0-9]{2}|655[1-2][0-9]|6553[1-5])$/ }
  end
  
end

testapphost = parse_config_file('README.md').testapp_IP
testappport = parse_config_file('README.md').testapp_port

control 'Configuration' do
  title 'Check testapp installation scenarios'

  %w(ruby-full ruby-bundler build-essential mongodb).each do |pkg|
      describe package(pkg) do
        it { should be_installed }
    end
  end

  # describe service('mongodb') do
  #   it { should be_enabled }
  #   it { should be_running }
  # end

  describe port(27017) do
    it { should be_listening }
    its('protocols') { should include 'tcp' }
    # its('processes') { should include 'mongod' }
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
