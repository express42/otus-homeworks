# encoding: utf-8
# copyright: 2018, The Authors

title 'gitlab-ci-2: structure'

control 'structure' do
  title 'Check repo structure'

  describe file('.gitlab-ci.yml') do
    it { should exist }
  end
end
