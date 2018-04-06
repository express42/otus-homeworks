# encoding: utf-8
# copyright: 2018, The Authors

title 'ansible-2: structure'

control 'structure' do
  title 'Check repo structure'

  dirs = [
    'ansible',
    'ansible/files',
    'ansible/templates',
  ]

  files = [
    '.gitignore',
    'README.md',
    'ansible/requirements.txt',
    'ansible/ansible.cfg',
    'ansible/inventory',
    'ansible/inventory.yml',
    'ansible/clone.yml',
    'ansible/packer_app.yml',
    'ansible/packer_db.yml',
    'ansible/reddit_app_multiple_plays.yml',
    'ansible/reddit_app_one_play.yml',
    'ansible/site.yml',
    'ansible/app.yml',
    'ansible/db.yml',
    'ansible/deploy.yml',
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
end
