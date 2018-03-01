# encoding: utf-8
# copyright: 2015, The Authors

title 'packer validation'

# you add controls here
control 'packer' do                        # A unique ID for this control
  impact 1                                # The criticality, if this control fails.
  title 'Run packer validate'             # A human-readable title

  describe file('packer/ubuntu16.json') do
    it { should exist }
  end

  describe command('cd packer && packer validate ubuntu16.json') do
    its('stdout') { should eq "Template validated successfully.\n" }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end
end
