# replace rubocop-rails-omakase with renuocop

gsub_file "Gemfile", /gem "rubocop-rails-omakase"/, "gem \"renuocop\""

# add "ruby file: ".ruby-version" to the Gemfile under the line starting with "source"
insert_into_file "Gemfile", after: /^source.*\n/ do
  <<~RUBY
    ruby File.read(".ruby-version").strip
  RUBY
end

# override the content of .rubocop.yml
create_file ".rubocop.yml", force: true do
  <<~RUBOCOP
    inherit_gem:
      renuocop: config/base.yml
  RUBOCOP
end

create_file "bin/fastcheck", force: true do
  <<~FASTCHECK
    #!/usr/bin/env bash
    set -euo pipefail

    if ! bundle exec rubocop -D -c .rubocop.yml --fail-fast
    then
      echo 'rubocop detected issues!'
      bundle exec rubocop -A -D -c .rubocop.yml
      echo 'Tried to auto correct the issues, but must be reviewed manually, commit aborted'
      exit 1
    fi
  FASTCHECK
end

run "chmod +x bin/fastcheck"

after_bundle do
  run "bundle exec rubocop -A"

  puts "We want to be sure that you are aware of what has been done by the Renuo template."
  puts "Please read the following list of changes and confirm that you understand them."
  ask "The Gemfile ruby version has been set to the version in the .ruby-version file. You know what this means.  Ok?"
  ask "Your project is now using renuocop instead of rubocop-rails-omakase. You know both gems and why it has been replaced. Ok?"
  ask "A .rubocop.yml file has been created with the default configuration. You know what this means. Ok?"
  ask "A bin/fastcheck script has been created to run rubocop with the default configuration."
  ask "You can run the script with `bin/fastcheck`. Youm know why we have a bin/fastcheck file. Ok?"
end
