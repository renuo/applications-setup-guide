# Naming Conventions

Naming the project properly is very important and even more important is doing it from the beginning.
We carefully choose the names for our projects and we always stick to the following conventions so you are
asked to do the same.

## Project Name

The project name `[project-name]` consists of `[base-project]-[sub-project]`, and only uses `[a-z0-9]` and dash `-`.
No underscore `_`.

## Extended Use

* Use `[project-name]` for project names and services which are branch-independent.
* Use `[project-name]-[branch]` for deployed projects (`[branch]` means the gitflow branch and not RAILS_ENV).
* Use `[project-name]-[branch]-[purpose]` for deployed projects (e.g. kingschair-master-assets).
* Use `[project-name]-local-[user]-[rails_env]` for local names which interact with online services (e.g. S3).

## Examples

* food-calendar, food-calendar-develop, food-calendar-develop-assets
* food-calendar-api, food-calendar-api-develop, food-calendar-api-develop-assets
* bauer-shoes, bauer-cars, bauer-cars-static
* vdrb-kas, vdrb-mv
* red-shoes, blue-hats (two projects which are independent and have the same customer)

## Scope of Application

The naming conventions should be applied everywhere. Some examples:

* Amazon S3 (usually [project-name]-[branch])
* Github ([project-name])
* Heroku ([project-name]-[branch])
* Redmine ([project-name])
* Semaphore CI (servers are named [project-name]-[branch])
* Drive ([project-name])
* New Relic ([project-name]-[branch])
* Get Sentry
* App name in Rails
* Sparkpost Account
* External services (e.g. datatrans)
* Database names
* Nginx / Apache
* Config files
* Directory names
* Analytics, Webmaster tools, Adwords
* Etc…
