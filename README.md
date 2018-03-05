# Automated tests for OTUS homeworks

## .travis.yml

```
dist: trusty
language: bash
sudo: required

before_install:
  - curl https://raw.githubusercontent.com/express42/otus-homeworks/2018-02/run.sh | bash
```
