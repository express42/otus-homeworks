# encoding: utf-8
# copyright: 2018, Express42

control 'structure' do
  title 'Check repo structure'

  describe file('.gitlab-ci.yml') do
    it { should exist }
    its('content') { should include 'image: ruby:2.4.2' }
    its('content') { should include 'DATABASE_URL:' }
    its('content') { should include '- cd reddit' }
    its('content') { should include '- mongo:latest' }
    its('content') { should include '- bundle install' }
    its('content') { should include '- ruby simpletest.rb' }
    # its('content') { should match(/%r{\n\Z}/) }
  end

  describe directory('reddit') do
    it { should exist }
  end

  describe file('reddit/Gemfile') do
    it { should exist }
    its('content') { should include "gem 'rack-test'" }
    # its('content') { should match(/%r{\n\Z}/) }
  end

  describe file('reddit/simpletest.rb') do
    it { should exist }
    its('content') { should include 'def test_get_request' }
    # its('content') { should match(/%r{\n\Z}/) }
  end
end
