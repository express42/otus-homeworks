# encoding: utf-8
# copyright: 2018, Express42

control 'reddit' do
  title 'Check k8s reddit app'

  describe file('kubernetes/Charts/gitlab-omnibus/templates/gitlab/gitlab-svc.yaml') do
    it { should exist }
    its('content') { should match /name:\sweb/ }
    its('content') { should match /port:\s80/ }
  end

  describe file('kubernetes/Charts/gitlab-omnibus/templates/gitlab-config.yaml') do
    it { should exist }
    its('content') { should match /template\s"fullname"/ }
  end

  describe file('kubernetes/Charts/gitlab-omnibus/templates/ingress/gitlab-ingress.yaml') do
    it { should exist }
    its('content') { should match /template\s"fullname"/ }
  end
end