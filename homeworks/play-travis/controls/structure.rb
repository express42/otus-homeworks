# encoding: utf-8
# copyright: 2018, The Authors

title 'play-travis: structure'

control 'structure' do
  title 'Check files structure'

  describe directory('play-travis') do
    it { should exist }
  end

  describe file('play-travis/test.py') do
    it { should exist }
  end
end
