# encoding: utf-8
# copyright: 2018, Express42

user = 'travisuser'
service = 'comment'

control 'build_comment' do
  title 'Check docker build_comment'

  describe command("cd src/#{service} && USER_NAME=#{user} bash docker_build.sh") do
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end
end
