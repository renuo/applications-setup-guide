# Configure the Continuous Deployment (CD)

We use Semaphore to deploy most of our apps. Some projects use CircleCI and
mobile apps use Fastlane. This article is about how to deploy to Heroku with
Semaphore.

## Prerequisites

* Heroku API key of `admin@renuo.ch` (*wg-operations* can help with that)

## Setup `master` and `develop`

Add two servers (very tiny plus button) and name them `[project-name]-master`
and `[project-name]-develop`.

Then edit the deploy commands to be the following:

```shell
git push --force heroku $BRANCH_NAME:master
```

## Setup `testing`

Add another server called `[project-name]-testing` and edit its deploy
commands to be the following.

```shell
git push --force heroku $BRANCH_NAME:master
heroku pg:reset DATABASE_URL --confirm one11-testing
heroku run -x "rails db:schema:load db:seed"
```

This setup differs in that we reset the database with each deployment.

## Conclusion

You have now your application running on all the three environments.
From now on, all the changes you will push on *develop*, *master*, or *testing*
branches in Github will be automatically deployed to the related server.

It's time to create some first Pull Requests with some improvements.
