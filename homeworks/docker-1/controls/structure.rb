# encoding: utf-8
# copyright: 2018, The Authors

title 'docker-1: structure'

control 'structure' do
  title 'Check repo structure'

  describe directory('docker-monolith') do
    it { should exist }
  end

  describe file('docker-monolith/docker-1.log') do
    it { should exist }
  end
end
