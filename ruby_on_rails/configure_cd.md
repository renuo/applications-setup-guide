# Configure the Continuous Deployment (CD)

We use Semaphore to deploy most of our apps. Some projects use CircleCI and
mobile apps use Fastlane. This article is about how to deploy to Heroku with
Semaphore.

## Setup `master`, `develop` and `testing`

* Add the following to `.semaphore/semaphore.yml`:

```
promotions:
  - name: develop
    pipeline_file: develop-deploy.yml
    auto_promote:
      when: "result = 'passed' and branch = 'develop'"
  - name: master
    pipeline_file: master-deploy.yml
    auto_promote:
      when: "result = 'passed' and branch = 'master'"
  - name: testing
    pipeline_file: testing-deploy.yml
    auto_promote:
      when: "result = 'passed' and branch = 'testing'"
```

* Add the three files called `develop-deploy.yml`, `master-deploy.yml` and `testing-deploy.yml` to the
`.semaphore` folder. You can look them up in the [templates](templates/.semaphore) folder.
Make sure to replace [project-name]

Commit and push the changes.

You should now see a third block where your deployment runs to Heroku.
Make sure it is green and deploys correctly:

![semaphoreci_2](../images/semaphore_cd.png)

## Conclusion

You have now your application running on all the three environments.
From now on, all the changes you will push on *develop*, *master*, or *testing*
branches in Github will be automatically deployed to the related server.

It's time to create some first Pull Requests with some improvements.
