# Naming Conventions

The page lists obligatory rules for our naming conventions. Please stick to it. For discussion go here: https://docs.google.com/document/d/1nu1LKFzck87wQAbSdM5n7Gi2SCX8Fw-IfwIgsUMHC-A/

## 1 Project Name

The project name [project-name] consists of [base-project]-[sub-project], and only uses [a-z0-9] and dash -. No underline _.

### 1.1 Extended Use

Use [project-name] for project names and services which are branch-independent.
Use [project-name]-[branch] for deployed projects ([branch] means the gitflow branch and *not* RAILS_ENV).
Use [project-name]-[branch]-[purpose] for deployed projects (*not* RAILS_ENV, e.g. kingschair-master-assets).
Use [project-name]-local-[user]-[rails_env] for local names which interact with online services (e.g. S3).

### 1.2 Examples

* food-calendar, food-calendar-develop, food-calendar-develop-assets
* food-calendar-api, food-calendar-api-develop, food-calendar-api-develop-assets
* bauer-shoes, bauer-cars, bauer-cars-static
* xdrb-kas, xdrb-mv
* But: red-shoes, blue-hats (two projects which are independent and have the same customer)

## 2 Scope of Application

The naming conventions should be applied everywhere. This includes these places:

* Amazon S3
* ~~gitlab~~ github
* heroku (different branches)
* no dots
* Redmine
* Renuo Deploy (deployment config name + folder)
* Drive
* New Relic
* GetSentry
* App name in Rails
* Mandrill Account
* Mailers
* Admin
* Info
* no-reply
* application.yml
* External services (e.g. datatrans)
* Database names
* CI (database name)
* Nginx / Apache
* Config files
* Directory names
* Analytics, Webmaster tools, Adwords
* DNSimple (domain name)
