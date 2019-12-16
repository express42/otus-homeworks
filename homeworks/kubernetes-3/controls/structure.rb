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
    'kubernetes/reddit/mongo-claim.yml',
    'kubernetes/reddit/mongo-claim-dynamic.yml',
    'kubernetes/reddit/mongo-network-policy.yml',
    'kubernetes/reddit/mongo-volume.yml',
    'kubernetes/reddit/storage-fast.yml',
    'kubernetes/reddit/ui-ingress.yml',
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