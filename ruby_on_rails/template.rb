# replace rubocop-rails-omakase with renuocop

gsub_file "Gemfile", /gem "rubocop-rails-omakase"/, "gem \"renuocop\""

insert_into_file "Gemfile", after: /^group :development do\n/ do
  <<~RUBY
    gem "renuo-cli", require: false
  RUBY
end

# replace bin/rails db:prepare with bin/rails db:setup in bin/setup
gsub_file "bin/setup", "bin/rails db:prepare", "bin/rails db:setup"

# add the renuo fetch-secrets command in bin/setup, before bin/rails db:setup
insert_into_file "bin/setup", before: "\n  puts \"\\n== Preparing database ==\"" do
  <<-RUBY
  puts "\\n== Fetching 1password dependencies =="
  system! 'renuo fetch-secrets'  
  RUBY
end

# remove the block unless ARGV.include?("--skip-server"). We don't want to start the server directly during setup.
gsub_file "bin/setup", /\n{0,2}[ \t]*unless ARGV.include\?\("--skip-server"\).*?end/m, ""

# add "ruby file: ".ruby-version" to the Gemfile under the line starting with "source"
insert_into_file "Gemfile", after: /^source.*\n/ do
  <<~RUBY
    ruby file: ".ruby-version"
  RUBY
end

# override the content of .rubocop.yml
create_file ".rubocop.yml", force: true do
  <<~RUBOCOP
    inherit_gem:
      renuocop: config/base.yml
  RUBOCOP
end

create_file "bin/run", force: true do
  <<~RUN
    #!/usr/bin/env bash
    set -euo pipefail

    rails s
  RUN
end
run "chmod +x bin/run"

create_file "bin/check", force: true do
  <<~CHECK
    #!/usr/bin/env bash
    set -euo pipefail

    bin/rails zeitwerk:check
  CHECK
end
run "chmod +x bin/check"

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
  ask "We have included renuo fetch-secrets in bin/setup. Do you know why?"
  ask "The Gemfile ruby version has been set to the version in the .ruby-version file. You know what this means. Ok?"
  ask "Your project is now using renuocop instead of rubocop-rails-omakase. You know both gems and why it has been replaced. Ok?"
  ask "A .rubocop.yml file has been created with the default configuration. You know what this means. Ok?"
  ask "A bin/run script has been created. You know why. Ok?"
  ask "A bin/check script has been created. You know why and what the commands in it do. Ok?"
  ask "A bin/fastcheck script has been created to run rubocop with the default configuration."
  ask "You can run the script with `bin/fastcheck`. You know why we have a bin/fastcheck file. Ok?"
end
