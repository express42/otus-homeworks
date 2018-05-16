# encoding: utf-8
# copyright: 2018, The Authors

title 'gitlab-ci-2: gitlab-ci-2'

control 'gitlab-ci-2' do
  title 'Check content of .gitlab.yml'

  describe file('.gitlab-ci.yml') do
    its('content') { should include 'name: branch/$CI_COMMIT_REF_NAME' }
    its('content') { should include 'name: stage' }
    its('content') { should include 'name: production' }
    its('content') { should include '- /^\d+\.\d+.\d+/' }
  end
end
