# Push to Git Repository

It's now time to push to the git repository and configure our CI and CD to deploy our application on Heroku.
To do that you first need to [Create a Git Repository](../create_git_repository.md).

After creating the repo you can connect your project to the remote git repo (if you didn't use `hub create` command) and push using:

```sh
git remote add origin git@github.com:renuo/[project-name].git
git push -u origin master
```