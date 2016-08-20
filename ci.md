# CI

## .travis.yml

If you need typescript, uncomment the tsd line.

Then navigate to https://travis-ci.com/profile/renuo and add the new project (you may have to refresh the repos manually).

See also https://github.com/renuo/rails-application-setup-guide/blob/master/templates/.travis.yml

## Readme.md

Setup the badges correctly.

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
