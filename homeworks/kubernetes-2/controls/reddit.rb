# encoding: utf-8
# copyright: 2018, Express42

control 'reddit' do
  title 'Check k8s reddit app'

  describe file('kubernetes/reddit/dev-namespace.yml') do
    it { should exist }
    its('content') { should match /name:\sdev/ }
  end

  describe file('kubernetes/reddit/ui-deployment.yml') do
    it { should exist }
    its('content') { should match /labels:\n\s+app:\sreddit\n\s+component:\sui/ }
    its('content') { should match /matchLabels:\n\s+app:\sreddit\n\s+component:\sui/ }
  end

  describe file('kubernetes/reddit/ui-service.yml') do
    it { should exist }
    its('content') { should match /labels:\n\s+app:\sreddit\n\s+component:\sui/ }
    its('content') { should match /protocol:\sTCP\n\s+targetPort:\s9292/ }
  end

  describe file('kubernetes/reddit/post-deployment.yml') do
    it { should exist }
    its('content') { should match /labels:\n\s+app:\sreddit\n\s+component:\spost/ }
    its('content') { should match /matchLabels:\n\s+app:\sreddit\n\s+component:\spost/ }
    its('content') { should match /name:\sPOST_DATABASE_HOST/ }
  end

  describe file('kubernetes/reddit/post-service.yml') do
    it { should exist }
    its('content') { should match /labels:\n\s+app:\sreddit\n\s+component:\spost/ }
    its('content') { should match /protocol:\sTCP\n\s+targetPort:\s5000/ }
  end

  describe file('kubernetes/reddit/comment-deployment.yml') do
    it { should exist }
    its('content') { should match /labels:\n\s+app:\sreddit\n\s+component:\scomment/ }
    its('content') { should match /matchLabels:\n\s+app:\sreddit\n\s+component:\scomment/ }
    its('content') { should match /name:\sCOMMENT_DATABASE_HOST/ }
  end

  describe file('kubernetes/reddit/comment-service.yml') do
    it { should exist }
    its('content') { should match /labels:\n\s+app:\sreddit\n\s+component:\scomment/ }
    its('content') { should match /protocol:\sTCP\n\s+targetPort:\s9292/ }
  end

  describe file('kubernetes/reddit/mongo-deployment.yml') do
    it { should exist }
    its('content') { should match /labels:\n\s+app:\sreddit\n\s+component:\smongo\n\s+comment-db:\s"true"/ }
    its('content') { should match /matchLabels:\n\s+app:\sreddit\n\s+component:\smongo/ }
    its('content') { should match /name:\smongo-persistent-storage/ }
  end

  describe file('kubernetes/reddit/mongodb-service.yml') do
    it { should exist }
    its('content') { should match /labels:\n\s+app:\sreddit\n\s+component:\smongo/ }
    its('content') { should match /protocol:\sTCP\n\s+targetPort:\s27017/ }
  end

  describe file('kubernetes/reddit/comment-mongodb-service.yml') do
    it { should exist }
    its('content') { should match /labels:\n\s+app:\sreddit\n\s+component:\smongo\n\s+comment-db:\s"true"/ }
    its('content') { should match /protocol:\sTCP\n\s+targetPort:\s27017/ }
  end
end