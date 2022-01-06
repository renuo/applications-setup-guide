# Linting and automatic checks :white_check_mark:

All Renuo projects contain (and your project must contain as well) the following linters.
Every linter consists of a gem (usually) and a command to add to our `bin/fastcheck` script.

Check out the `bin/fastcheck` [fastcheck](../templates/bin/fastcheck) for the final version of it.

## Rubocop :cop:

```ruby
group :development, :test do
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end
```

Please add them to every Rails project and use the [rubocop configuration provided](../templates/.rubocop.yml) adding a `.rubocop.yml` file in the root of the project.

**This file may get outdated quickly**. Please update it if necessary with a PR.
If you need to change it in a specific project you may want to consider to change this template as well for the future.

After configuring it, you can execute it and correct the issues you'll find.

`bundle exec rubocop -a` will fix most of them automatically.

Once all issues are fixed add the check to our `bin/fastcheck` and create a PR. Example:

```bash
#!/bin/sh

set -e

echo "Executing rubocop"
bundle exec rubocop -D
```

## Brakeman

```ruby
group :development, :test do
  gem 'brakeman', require: false
end
```

## Mdl

```ruby
group :development, :test do
  gem 'mdl', require: false
end
```

## SCSS lint

Install the dependencies:
```shell
yarn add --dev stylelint stylelint-config-standard-scss
```

Create a configuration file [`.stylelintrc.json`](../templates/.stylelintrc.json) with the content:
```json
{
  "extends": "stylelint-config-standard-scss"
}
```

Add `npx stylelint "**/*.scss"` to `bin/fastcheck`.

Visit [styline](https://stylelint.io/user-guide/get-started) for more information.

## Slim lint

> only if you'll use slim templates

```ruby
group :development, :test do
  gem 'slim_lint', require: false
end
```

## ESLint

```
yarn add eslint
yarn eslint --init (Use a popular style guide -> Airbnb)
```

then extend the `bin/fastcheck` script with:

```
yarn eslint app/javascript
```

The templates folder contains a template for the eslint configuration.

## All Good!

Now your `bin/fastcheck` is not that fast anymore :smile:
