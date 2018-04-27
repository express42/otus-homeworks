# encoding: utf-8
# copyright: 2018, The Authors

title 'docker-2: structure'

control 'structure' do
  title 'Check repo structure'

  dirs = [
    'docker-monolith',
  ]

  files = [
    'README.md',
    'docker-monolith/Dockerfile',
    'docker-monolith/db_config',
    'docker-monolith/mongod.conf',
    'docker-monolith/start.sh',
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
end
