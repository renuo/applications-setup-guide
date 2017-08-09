# Initialise Gitflow

You can initialise gitflow in you project with `git flow init -d`

Then push also your new develop branch `git push --set-upstream origin develop`

If you opted in for the testing environment is time to push also that branch:
```bash
git checkout -b testing
git push --set-upstream origin testing
```

Once you have pushed all the three branches you can finish the [configuration of Git Repository](../configure_git_repository.md)
