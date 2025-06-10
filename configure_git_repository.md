# Configure the Git Repository

These are the suggested configurations for our GitHub repositories.
Please stick to it unless you have special needs.

* General Settings
  * Features: Remove *Wikis*, *Issues* and *Projects*
  * Pull Requests
    * Disable *Allow merge commits* and *Allow rebase merging*
    * Allow auto-merge
    * Automatically delete head branches
* Manage access
  * Add *staff* team as a collaborator with Admin access
  * Add *security* team as collaborator with Write access
* Branches
  * Default branch: either `main` or `develop` depending on whether you want one or two environments.
  * Add these rules for the two branches `develop` and `main`:
    * Require pull request reviews before merging
    * Require status checks to pass before merging (after you configured the CI add it to the required checks)
    * Always suggest updating pull request branches

* Autolink references
  * Add a new Autolink reference with:
    * Reference prefix: `TICKET-`
    * Target URL: `https://redmine.renuo.ch/issues/<num>`

## Team

Each project has a team owning it. The team is named after the project: `[team-name] = [project-name]`.
Thanks to this we can:

* see who is responsible for a project;
* assign issues to the right team;
* assign pull requests to the right team.

* Create a team with the name of the project and add all the developers working on it;
* Give to each team member the role "maintainer";
* Add the team to the repository with the "administrator" role;
* Add a CODEOWNERS file with the team name in it:

```markdown
# .github/CODEOWNERS

* @renuo/[team-name]
```
