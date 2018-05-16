# encoding: utf-8
# copyright: 2018, The Authors

title 'docker-3: structure'

control 'structure' do
  title 'Check repo structure'

  dirs = [
    'src',
    'src/ui',
    'src/comment',
    'src/post-py',
  ]

  files = [
    'README.md',
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
end
