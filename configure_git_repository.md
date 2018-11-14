# Configure the Git Repository

These are the suggested configurations for our GitHub repositories.
Please stick to it unless you have special needs.

Proceed to the **Insights** of the project and configure the following:
* **Dependency graph**:
  * Allow access

Proceed to the **Settings** of the project and adjust the following:
* **Options**:
  * You can disable Wikis, Issues and Projects features from configuration
* **Collaborators & Teams**:
  * Add Renuo team as a collaborator with Admin access
  * Add Security team as collaborator with Write access
* **Branches**:
  * Default branch: `develop`
  * Protect the branches develop and master checking:
    * Require pull request reviews before merging
    * Require status checks to pass before merging
    * Require branches to be up to date before merging
* **Alerts**:
  * Add Security team

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

**There should never be more then one responsibility tag per project.**
