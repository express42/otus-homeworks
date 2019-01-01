# encoding: utf-8
# copyright: 2018, Express42

control 'logging' do
  title 'Check logging settings'

  describe file('logging/fluentd/fluent.conf') do
    it { should exist }
    its('content') { should match (/grok_pattern %{RUBY_LOGGER}/)}
    its('content') { should match (/pattern service=%{WORD:service} \\| event=%{WORD:event} \\| request_id=%{GREEDYDATA:request_id} \\| message='%{GREEDYDATA:message}'/)}
    its('content') { should match (/@type elasticsearch/)}
  end
end
