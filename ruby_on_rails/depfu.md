# Depfu

Depfu is a service which checks out the Gemfile of a project for problematic
dependencies. It will automatically create a pull request to the project
if a security vulnerability has been disclosed.

1. Ask wg-operations to add repository access for Depfu to you new Github
repository.

That's all :-)

In some project we have a monthly `bundle update` which is automatically
done by Depfu. This has to be requested per mail: florian@depfu.com

