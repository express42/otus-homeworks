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
    its('content') { should match /labels:\n\s\s\s\sapp:\sreddit\n\s\s\s\scomponent:\sui/ }
    its('content') { should match /matchLabels:\n\s\s\s\s\s\sapp:\sreddit\n\s\s\s\s\s\scomponent:\sui/ }
  end

  describe file('kubernetes/reddit/ui-service.yml') do
    it { should exist }
    its('content') { should match /labels:\n\s\s\s\sapp:\sreddit\n\s\s\s\scomponent:\sui/ }
    its('content') { should match /protocol:\sTCP\n\s\s\s\stargetPort:\s9292/ }
  end

  describe file('kubernetes/reddit/post-deployment.yml') do
    it { should exist }
    its('content') { should match /labels:\n\s\s\s\sapp:\sreddit\n\s\s\s\scomponent:\spost/ }
    its('content') { should match /matchLabels:\n\s\s\s\s\s\sapp:\sreddit\n\s\s\s\s\s\scomponent:\spost/ }
    its('content') { should match /name:\sPOST_DATABASE_HOST/ }
  end

  describe file('kubernetes/reddit/post-service.yml') do
    it { should exist }
    its('content') { should match /labels:\n\s\s\s\sapp:\sreddit\n\s\s\s\scomponent:\spost/ }
    its('content') { should match /protocol:\sTCP\n\s\s\s\stargetPort:\s5000/ }
  end

  describe file('kubernetes/reddit/comment-deployment.yml') do
    it { should exist }
    its('content') { should match /labels:\n\s\s\s\sapp:\sreddit\n\s\s\s\scomponent:\scomment/ }
    its('content') { should match /matchLabels:\n\s\s\s\s\s\sapp:\sreddit\n\s\s\s\s\s\scomponent:\scomment/ }
    its('content') { should match /name:\sCOMMENT_DATABASE_HOST/ }
  end

  describe file('kubernetes/reddit/comment-service.yml') do
    it { should exist }
    its('content') { should match /labels:\n\s\s\s\sapp:\sreddit\n\s\s\s\scomponent:\scomment/ }
    its('content') { should match /protocol:\sTCP\n\s\s\s\stargetPort:\s9292/ }
  end

  describe file('kubernetes/reddit/mongo-deployment.yml') do
    it { should exist }
    its('content') { should match /labels:\n\s\s\s\sapp:\sreddit\n\s\s\s\scomponent:\smongo\n\s\s\s\scomment-db:\s"true"/ }
    its('content') { should match /matchLabels:\n\s\s\s\s\s\sapp:\sreddit\n\s\s\s\s\s\scomponent:\smongo/ }
    its('content') { should match /name:\smongo-persistent-storage/ }
  end

  describe file('kubernetes/reddit/mongodb-service.yml') do
    it { should exist }
    its('content') { should match /labels:\n\s\s\s\sapp:\sreddit\n\s\s\s\scomponent:\smongo/ }
    its('content') { should match /protocol:\sTCP\n\s\s\s\stargetPort:\s27017/ }
  end

  describe file('kubernetes/reddit/comment-mongodb-service.yml') do
    it { should exist }
    its('content') { should match /labels:\n\s\s\s\sapp:\sreddit\n\s\s\s\scomponent:\smongo\n\s\s\s\scomment-db:\s"true"/ }
    its('content') { should match /protocol:\sTCP\n\s\s\s\stargetPort:\s27017/ }
  end
end