# Configure the CI

At Renuo we **always** use a CI (Continuous Integration) system to test our applications. It's essential to guarantee
that all the tests pass before building and releasing a new version through our CD system. Our projects use
[SemaphoreCI 2.0](<https://semaphoreci.com/>).

Before configuring the CI, you should already have a Git Repository with the code, a `bin/check` command to execute,
and the main branches already pushed and ready to be tested.

* Proceed to <https://renuo.semaphoreci.com/> and login or create an account with your Renuo email address.

* Create a project here: <https://renuo.semaphoreci.com/new_project>

## Rails specific configuration

```
renuo configure-semaphore
```

The command will copy the necessary templates to `.semaphore` folder.
