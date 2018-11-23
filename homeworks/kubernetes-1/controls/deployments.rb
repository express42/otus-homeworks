# encoding: utf-8
# copyright: 2018, Express42

control 'deployments' do
    title 'Check k8s deployments'
  
    describe file('kubernetes/reddit/ui-deployment.yml') do
      it { should exist }
      its('content') { should match (/name:\sui-deployment/)}
      its('content') { should match (/app:\sui/)}
    end

    describe file('kubernetes/reddit/post-deployment.yml') do
        it { should exist }
        its('content') { should match (/name:\spost-deployment/)}
        its('content') { should match (/app:\spost/)}
    end

    describe file('kubernetes/reddit/mongo-deployment.yml') do
        it { should exist }
        its('content') { should match (/name:\smongo-deployment/)}
        its('content') { should match (/app:\smongo/)}
    end

    describe file('kubernetes/reddit/comment-deployment.yml') do
        it { should exist }
        its('content') { should match (/name:\scomment-deployment/)}
        its('content') { should match (/app:\scomment/)}
    end
end