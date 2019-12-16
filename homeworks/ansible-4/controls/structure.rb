# encoding: utf-8
# copyright: 2018, The Authors

title 'ansible-3: structure'

control 'structure' do
  title 'Check repo structure'

  dirs = [
    'ansible',
    'ansible/playbooks',
    'ansible/roles',
    'ansible/old',
    'ansible/roles/app',
    # 'ansible/roles/db',
    # 'ansible/roles/db/molecule',
    'ansible/environments',
    'ansible/environments',
    'ansible/environments/stage',
    'ansible/environments/stage/group_vars',
    'ansible/environments/prod',
    'ansible/environments/prod/group_vars',
  ]

  files = [
    '.gitignore',
    'README.md',
    'ansible/requirements.txt',
    'ansible/ansible.cfg',
    'ansible/Vagrantfile',
    'ansible/playbooks/packer_app.yml',
    'ansible/playbooks/packer_db.yml',
    'ansible/playbooks/site.yml',
    'ansible/playbooks/users.yml',
    'ansible/playbooks/base.yml',
    'ansible/playbooks/app.yml',
    'ansible/playbooks/db.yml',
    'ansible/playbooks/deploy.yml',
    'ansible/environments/stage/requirements.yml',
    'ansible/environments/prod/requirements.yml',
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

  describe file('ansible/requirements.txt') do
    its('content') { should match /molecule/ }
  end
end
