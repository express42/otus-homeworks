# encoding: utf-8
# copyright: 2018, The Authors

title 'packer-base: structure'

control 'structure' do
  title 'Check files structure'

  describe directory('packer') do
    it { should exist }
  end

  describe file('packer/ubuntu16.pkr.hcl') do
    it { should exist }
  end

  describe file('packer/variables.pkr.hcl.example') do
    it { should exist }
  end

  describe directory('packer/scripts') do
    it { should exist }
  end

  describe file('packer/scripts/install_ruby.sh') do
    it { should exist }
  end

  describe file('packer/scripts/install_mongodb.sh') do
    it { should exist }
  end
end
