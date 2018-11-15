# encoding: utf-8
# copyright: 2018, Express42

control 'structure' do
  title 'Check repo structure, docker-compose.yml & newline https://stackoverflow.com/questions/729692/why-should-text-files-end-with-a-newline'

  dirs = [
    'logging',
    'logging/fluentd',
  ]

  files = [
    'README.md',
    'docker/.env.example',
    'docker/docker-compose-logging.yml',
    'logging/fluentd/Dockerfile',
    'logging/fluentd/fluent.conf',
    'src/ui/Dockerfile',
    'src/comment/Dockerfile',
    'src/post-py/Dockerfile',
  ]

  dirs.each do |path|
    describe directory(path) do
      it { should exist }
    end
  end

  files.each do |path|
    describe file(path) do
      it { should exist }
      its('content') { should match(%r{\n\Z}) }
    end
  end

  describe file('docker/.env') do
    it { should_not exist }
  end

  describe command('cd docker && cp .env.example .env && docker-compose -f docker-compose.yml config') do
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end
end