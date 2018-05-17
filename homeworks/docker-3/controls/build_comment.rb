# encoding: utf-8
# copyright: 2018, The Authors

title 'docker-3: build_comment'

user = 'travisuser'

control 'docker' do
  title 'Check build_comment'

  describe command("cd src/comment && USER_NAME=#{user} bash docker_build.sh") do
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end
end
