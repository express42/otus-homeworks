# encoding: utf-8
# copyright: 2018, The Authors

title 'docker-3: build_ui'

user = 'travisuser'

control 'docker' do
  title 'Check build_ui'

  describe command("cd src/ui && USER_NAME=#{user} bash docker_build.sh") do
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end
end
