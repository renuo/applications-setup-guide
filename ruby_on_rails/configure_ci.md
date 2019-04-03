# Configure the CI

At Renuo we **always** use a CI (Continuous Integration) system to test our applications. It's essential to guarantee
that all the tests pass before building and releasing a new version through our CD system. Our projects use
[SemaphoreCI](<https://semaphoreci.com/>).

Before configuring the CI, you should already have a Git Repository with the code, a `bin/check` command to execute,
and the main branches already pushed and ready to be tested.

* Proceed to <https://semaphoreci.com/> and login or create an account with your Renuo email address.
You should already be part of the Renuo organisation but you may not have permissions to add a project to
the organisation. That's not a problem, you can configure it anyway and ask wg-operations to transfer it to
the organisation afterwards (you have 100 free builds)
* Create a project here for the branch `master`: <https://semaphoreci.com/organizations/renuo/projects/new>
* Skip the automated project analysis and choose `JavaScript` as *Language* with the newest version available.

## Rails specific configuration

Add two jobs to the configuration:

* Setup Job

  ```sh
  cd ~/.rbenv/plugins/ruby-build && git pull && cd $SEMAPHORE_PROJECT_DIR
  git checkout -- .ruby-version && rbenv install
  gem install bundler --no-ri --no-rdoc

  export RAILS_ENV=test
  export TZ=Europe/Zurich
  bundle install --without production development --deployment --jobs 3 --retry 3
  bin/yarn install
  cp config/application.example.yml config/application.yml
  bin/rails db:create db:schema:load
  ```

* Tests Job

  ```sh
  bin/check
  ```

Make sure that the build is green before you proceed. Then setup the `develop` branch like you
just did for the `master`.

Afterwards, configure your project and select in the *Branches* section:
  * Cancel queued and started builds
  * Priority branches: master, develop, testing (one per line)

When you have your three green builds you have configured your CI properly.

![semaphoreci_2](../images/semaphoreci_2.png)

To proceed further we need to create our servers and then configure the Continuous Deployment.
