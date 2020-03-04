# Depfu

Depfu is a service which checks out the Gemfile / yarn.lock of a project for problematic
dependencies. It will automatically create a pull request to the project
if a security vulnerability has been disclosed.

1. Ask wg-operations to add repository access for Depfu to you new Github
repository.

That's all :-)

Update strategy should be set to `Grouped Updates`, frequency: `monthly`. Assignee should be set.
