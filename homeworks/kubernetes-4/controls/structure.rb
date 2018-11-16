# encoding: utf-8
# copyright: 2018, Express42

control 'structure' do
  title 'Check repo structure'

  dirs = [
    'kubernetes',
    'kubernetes/Charts',
    'kubernetes/Charts/comment',
    'kubernetes/Charts/comment/templates',
    'kubernetes/Charts/post',
    'kubernetes/Charts/post/templates',
    'kubernetes/Charts/reddit',
    'kubernetes/Charts/ui',
    'kubernetes/Charts/ui/templates',
    'kubernetes/Charts/gitlab-omnibus'
  ]

  files = [
    'README.md',
    'kubernetes/Charts/reddit/Chart.yaml',

    'kubernetes/Charts/ui/Chart.yaml',
    'kubernetes/Charts/ui/templates/_helpers.tpl',
    'kubernetes/Charts/ui/templates/deployment.yaml',
    'kubernetes/Charts/ui/templates/ingress.yaml',
    'kubernetes/Charts/ui/templates/service.yaml',

    'kubernetes/Charts/post/Chart.yaml',
    'kubernetes/Charts/post/templates/_helpers.tpl',
    'kubernetes/Charts/post/templates/deployment.yaml',
    'kubernetes/Charts/post/templates/service.yaml',

    'kubernetes/Charts/comment/Chart.yaml',
    'kubernetes/Charts/comment/templates/_helpers.tpl',
    'kubernetes/Charts/comment/templates/deployment.yaml',
    'kubernetes/Charts/comment/templates/service.yaml',

    'src/ui/.gitlab-ci.yml',
    'src/post/.gitlab-ci.yml',
    'src/comment/.gitlab-ci.yml',
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