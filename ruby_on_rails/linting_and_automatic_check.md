# Linting and automatic checks :white_check_mark:

All Renuo projects contain (and your project must contain as well) the following linters.
Every linter consists of a gem (usually) and a command to add to our `bin/fastcheck` script.

Check out the `bin/fastcheck` [fastcheck](../templates/bin/fastcheck) for the final version of it.

## Rubocop :cop:

```ruby
group :development, :test do
  gem 'rubocop', require: false
end
```

Please add it to every Rails project and use the [rubocop configuration provided](../templates/.rubocop.yml) adding a `.rubocop.yml` file in the root of the project.

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

## Reek

```ruby
group :development, :test do
  gem 'reek', require: false
end
```

Use the [provided reek configuration](../templates/.reek.yml) by adding a `.reek.yml` file in the root of the project.

## SCSS lint

```ruby
group :development, :test do
  gem 'scss_lint', require: false
end
```

## Slim lint

> only if you'll use slim templates

```ruby
group :development, :test do
  gem 'slim_lint', require: false
end
```

## ESLint

> only if you'll use `es6` javascript.

```
yarn add eslint
eslint --init (Use a popular style guide -> Airbnb)
```

then extend the `bin/check` script with:

```
echo "\n== ESLint =="
yarn eslint app/assets/javascripts/**/*.es6
if [ $? -ne 0 ]; then
  echo 'ESLint detected issues.'
  exit 1
fi
```

## All Good!

Now your `bin/fastcheck` is not that fast anymore :smile:
