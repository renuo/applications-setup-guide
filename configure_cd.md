# Configure a Continuous Deployment (CD)

You can configure continuous deployment on *SemaphoreCI*.

Configure an automatic deployment to each *Heroku* application (`[project-name]-master`,`[project-name]-develop`,
`[project-name]-testing`). Use the API key of `admin@renuo.ch` for this task. wg-operations will help you, if you do
not have access.

The deployment should execute the following deploy commands:

```shell
git push --force heroku $BRANCH_NAME:master
heroku run -x "rails db:migrate || rails db:setup"
```

this will deploy the code and migrate the database to the latest version.

Name each server with the `[branch-name]` you are deploying.
