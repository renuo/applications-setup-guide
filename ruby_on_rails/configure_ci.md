# Configure the CI

At Renuo we **always** use a CI (Continuous Integration) system to test our applications. It's essential to guarantee
that all the tests pass before building and releasing a new version through our CD system. Our projects use
[SemaphoreCI 2.0](<https://semaphoreci.com/>).

Before configuring the CI, you should already have a Git Repository with the code, a `bin/check` command to execute,
and the main branches already pushed and ready to be tested.

1. Proceed to <https://renuo.semaphoreci.com/> and login or create an account with your Renuo email address.
1. Follow this instructions to install semaphore CLI https://docs.semaphoreci.com/reference/sem-command-line-tool/
1. Create a project here: <https://renuo.semaphoreci.com/new_project>

## Rails specific configuration

```sh
renuo configure-semaphore
```

The command will copy the necessary templates to `.semaphore` folder.

1. Add a file called `.nvmrc` to the project root, where you specify the latest node version
1. Commit the files to all three branches, push and watch the CI run.

When you have your three green builds you have configured your CI and CD properly.

![semaphoreci_2](../images/semaphore_ci.png)

You should now see a third block where your deployment runs to Heroku.
Make sure it is green and deploys correctly:

![semaphoreci_2](../images/semaphore_cd.png)

## Conclusion

You have now your application running on all the three environments.
From now on, all the changes you will push on *develop*, *master*, or *testing*
branches in Github will be automatically deployed to the related server.

It's time to create some first Pull Requests with some improvements.
