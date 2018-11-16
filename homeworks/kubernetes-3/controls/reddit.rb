# encoding: utf-8
# copyright: 2018, Express42

control 'reddit' do
  title 'Check k8s reddit app'

  describe file('kubernetes/reddit/ui-ingress.yml') do
    it { should exist }
    its('content') { should match /secretName:\sui-ingress/ }
  end

  describe file('kubernetes/reddit/mongo-deployment.yml') do
    it { should exist }
    its('content') { should match /name:\smongo-gce-pd-storage/ }
    its('content') { should match /persistentVolumeClaim:/ }
    its('content') { should match /post-db:\s"true"/ }
  end
end