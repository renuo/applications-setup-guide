# replace rubocop-rails-omakase with renuocop

gsub_file "Gemfile", /gem "rubocop-rails-omakase"/, "gem \"renuocop\""

# override the content of .rubocop.yml
create_file ".rubocop.yml", force: true do
  <<~RUBOCOP
    inherit_gem:
      renuocop: config/base.yml
  RUBOCOP
end

after_bundle do
  run "bundle exec rubocop -A"
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

