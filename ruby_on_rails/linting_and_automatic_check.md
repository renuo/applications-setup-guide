# Linting and automatic checks :white_check_mark:

All Renuo projects contain (and your project must contain as well) the following linters.
Every linter consists of a gem (usually) and a command to add to our `bin/fastcheck` script.

Check out the `bin/fastcheck` [fastcheck](../templates/bin/fastcheck) for the final version of it.

## Renuocop :cop: aka Standard aka Rubocop

```ruby
group :development, :test do
  gem 'renuocop', require: false
end
```

Please add it to every Rails project and use the [rubocop configuration provided](../templates/.rubocop.yml) adding a `.rubocop.yml` file in the root of the project.

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

To lint the SASS/SCSS files in our project we are going to use the `sass-lint` npm package.

`bin/yarn add sass-lint`

Add to the project the linter configuration file you can find in the templates folder and check the `bin/fastcheck`
template to see the command to execute the SCSS linting.

You may also need to add the `scss_lint` gem to your gemfile.

## Erb lint

```ruby
group :development, :test do
  gem 'erb_lint', require: false
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
