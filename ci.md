# CI

## .travis.yml

```yml
addons:
  apt:
    packages:
    - zsh
  postgresql: '9.4'
language: ruby
services:
  - postgresql
bundler_args: --without production development --deployment --jobs=3 --retry=3
cache:
  bundler: true
  apt: true
  directories:
    - coverage
before_install:
  - export TZ=Europe/Zurich
before_script:
  - bin/setup
  - export DISPLAY=:99.0
  - sh -e /etc/init.d/xvfb start
  - sleep 3
script: bin/check
notifications:
  email:
    on_success: change
    on_failure: always
```

### TSD / TypeScript Typings

The typings are loaded directly from GitHub. Unfortunately, GitHub has a rate limit. To overcome this, do the following:

1. Go to https://github.com/settings/tokens and generate a new token without any permissions
2. ```gem install travis```
3. ```travis encrypt TSDRC_TOKEN=yourGeneratedToken --add```
4. Add the following line to the before_script section: ```  - echo {\"token\":\"$TSDRC_TOKEN\"} > .tsdrc```
5. ```echo ".tsdrc" >> .gitignore```
6. Commit

## ~~GiltabCI [Deprecated, don't use it anymore!]~~

~~Simply log into the renuo CI and add the project. Once you have added it, click on it, go to settings, and paste the
following code in the build steps field:~~

```sh
cp config/database.ci.yml config/database.yml
cp config/application.example.yml config/application.yml
eval "$(rbenv init -)"
ruby -v
rbenv local
rbenv shell "$(rbenv local)"
ruby -v
bundle install
RAILS_ENV=test bundle exec rake db:drop
RAILS_ENV=test bundle exec rake db:create
RAILS_ENV=test bundle exec rspec
```

~~After that put under @project settings > Make tabs for the following branches@ the following two branches: _master_, _develop_~~

~~If you're not able to run the script because there is no commit visible, then you can push an empty dummy commit with the following commands:~~

```sh
git commit --allow-empty
git push origin master
```
