# Linting and automatic checks :white_check_mark:

All Renuo projects contain (and your project must contain as well) the following linters.
Every linter consists of a gem (usually) and a command to add to our `bin/fastcheck` script.

Check out the `bin/fastcheck` [fastcheck](../templates/bin/fastcheck) for the final version of it.

## Renuocop :cop:

Renuocop is based on Standard Ruby and is a set of rules that we use to lint our Ruby code.
It's already included in your Gemfile by default.

You can execute it and correct the issues you'll find.

`bundle exec rubocop -A` will fix ~~most~~ all of them automatically.

## Brakeman

Brakeman comes by default with Rails. Add it to the `bin/fastcheck` script.

```
bundle exec brakeman -q -z --no-summary --no-pager
```

## Mdl

An optional check for markdown files. You can include it or not. Discuss within your team.

```ruby
group :development, :test do
  gem 'mdl', require: false
end
```

## SCSS lint

To lint the SASS/SCSS files in our project you can use the `stylelint` npm package.

`bin/yarn add stylelint stylelint-config-standard-scss`

Add to the project the [linter configuration file](../templates/stylelintrc.yml) and check the [`bin/fastcheck`
template](../templates/bin/fastcheck) to see the command to execute the SCSS linting.

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
