# encoding: utf-8
# copyright: 2018, Express42

control 'structure' do
  title 'Check repo structure'

  dirs = [
    'kubernetes',
    'kubernetes/reddit'
  ]

  files = [
    'README.md',
    'kubernetes/reddit/dev-namespace.yml',
    'kubernetes/reddit/ui-deployment.yml',
    'kubernetes/reddit/ui-service.yml',
    'kubernetes/reddit/post-deployment.yml',
    'kubernetes/reddit/post-service.yml',
    'kubernetes/reddit/comment-deployment.yml',
    'kubernetes/reddit/comment-service.yml',
    'kubernetes/reddit/mongo-deployment.yml',
    'kubernetes/reddit/mongodb-service.yml',
    'kubernetes/reddit/comment-mongodb-service.yml',
  ]

  dirs.each do |path|
    describe directory(path) do
      it { should exist }
    end
  end

  files.each do |path|
    describe file(path) do
      it { should exist }
    end
  end
end