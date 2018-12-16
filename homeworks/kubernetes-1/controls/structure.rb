# encoding: utf-8
# copyright: 2018, Express42

control 'structure' do
  title 'Check repo structure'

  dirs = [
    'kubernetes',
    'kubernetes/reddit',
    'kubernetes/the_hard_way/'
  ]

  files = [
    'README.md',
    'kubernetes/reddit/ui-deployment.yml',
    'kubernetes/reddit/post-deployment.yml',
    'kubernetes/reddit/mongo-deployment.yml',
    'kubernetes/reddit/comment-deployment.yml',
    'kubernetes/the_hard_way/kube-scheduler.kubeconfig',
    'kubernetes/the_hard_way/worker-0.kubeconfig',
    'kubernetes/the_hard_way/kube-controller-manager.kubeconfig'
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