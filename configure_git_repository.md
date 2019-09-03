# Configure the Git Repository

These are the suggested configurations for our GitHub repositories.
Please stick to it unless you have special needs.

* Options
  * Features: Remove *Wikis*, *Issues* and *Projects*
  * Data services: Enable *Dependency graph* and *Vulnerability alerts*
  * Merge button: Automatically delete head branches
* Collaborators & teams
  * Add Renuo team as a collaborator with Admin access
  * Add Security team as collaborator with Write access
* Branches
  * Default branch: `develop`. Click *update*
  * Add these rules for the two branches `develop` and `master`:
    * Require pull request reviews before merging
    * Require status checks to pass before merging
    * Require branches to be up to date before merging
* Alerts
  * Add team `renuo/security`

## Responsibility Tag

Some Renuo Projects have a "Responsibility Tag". Thanks to this tag we can:

* see who is responsible for a project;
* see all the projects of a working group or person.

On the **\<\>Code** page of the GitHub project click on *Manage topics* and add a responsibility tag following this
convention: `r-[responsible]` where `responsible` can be:

* name of working group (if is a working group project)
* first name and lastname of a Renuo employee (if is a personal project)

Some examples:

`r-wg-education`, `r-wg-operations`, `r-alessandrorodi`, `r-simonhuber`

If you have doubts, look at the other projects of Renuo.

**There should never be more than one responsibility tag per project.**
