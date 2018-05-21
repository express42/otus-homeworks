# encoding: utf-8
# copyright: 2018, Express42

control 'structure' do
  title 'Check repo structure, docker-compose.yml & newline https://stackoverflow.com/questions/729692/why-should-text-files-end-with-a-newline'

  dirs = [
    'docker',
    'docker/docker-monolith',
    'monitoring',
    'monitoring/prometheus',
    'src',
    'src/ui',
    'src/comment',
    'src/post-py',
  ]

  files = [
    'README.md',
    'docker/.env.example',
    'docker/docker-compose.yml',
    'docker/docker-compose-monitoring.yml',
    'monitoring/prometheus/Dockerfile',
    'monitoring/prometheus/prometheus.yml',
    'monitoring/prometheus/alerts.yml',
    'monitoring/alertmanager/Dockerfile',
    'monitoring/alertmanager/config.yml',
    'src/ui/Dockerfile',
    'src/comment/Dockerfile',
    'src/post-py/Dockerfile',
  ]

  dashboards = [
    'monitoring/grafana/dashboards/Business_Logic_Monitoring.json',
    'monitoring/grafana/dashboards/DockerMonitoring.json',
    'monitoring/grafana/dashboards/UI_Service_Monitoring.json',
  ]

  dirs.each do |path|
    describe directory(path) do
      it { should exist }
    end
  end

  files.each do |path|
    describe file(path) do
      it { should exist }
      its('content') { should match(%r{\n\Z}) }
    end
  end

  dashboards.each do |path|
    describe json(path) do
      its(['time', 'to']) { should eq('now') }
    end
  end

  describe file('docker/.env') do
    it { should_not exist }
  end

  describe command('cd docker && cp .env.example .env && docker-compose -f docker-compose.yml -f docker-compose-monitoring.yml config') do
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end
end
