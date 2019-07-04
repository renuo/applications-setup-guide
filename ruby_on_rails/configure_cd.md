# Configure the Continuous Deployment (CD)

We use Semaphore to deploy most of our apps. Some projects use CircleCI and
mobile apps use Fastlane. This article is about how to deploy to Heroku with
Semaphore.

## Prerequisites

* Heroku API key of `admin@renuo.ch` (*wg-operations* can help with that)

## Setup `master`, `develop` and `testing`

Add three servers (very tiny plus button) and name them `master`
and `develop` and `testing`.

Then edit the deploy commands to be the following:

```shell
git push --force heroku $BRANCH_NAME:master
```

## Conclusion

You have now your application running on all the three environments.
From now on, all the changes you will push on *develop*, *master*, or *testing*
branches in Github will be automatically deployed to the related server.

It's time to create some first Pull Requests with some improvements.
