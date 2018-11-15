# Configure the Continuous Deployment (CD)

You can configure continuous deployment on SemaphoreCI.

Configure an automatic deployment to each Heroku application (`[project-name]-master`,`[project-name]-develop`,
`[project-name]-testing`). Use the API key of `admin@renuo.ch` for this task. wg-operations will help you, if you do
not have access.

The deployment should execute the following deploy commands:

```shell
git push --force heroku $BRANCH_NAME:master
heroku run -x "rails db:migrate || rails db:setup"
```

this will deploy the code and migrate the database to the latest version.

Name each server with the `[branch-name]` you are deploying.

You have now your application running on all the three environments.
From now on, all the changes you will push on *develop*, *master*, or *testing* will be automatically deployed to
the relative server.
It's time to create some first Pull Requests with some improvements.
