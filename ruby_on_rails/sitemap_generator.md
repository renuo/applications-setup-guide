# Sitemap Generator

Here you will learn how to implement a Sitemap Generator into your project. This guide also includes details on how you can create a script that automatically updates the sitemap file, and a GitHub Action that will automatically run the script and push the changes to a new pull request.

## Implementation

For implementing the sitemap generator itself, you can check out the gem repository [here](https://github.com/kjvarga/sitemap_generator). It contains all the necessary information on how to initialize the generator and how to configure the sitemap. Pay attention to the [alternate links section](https://github.com/kjvarga/sitemap_generator#alternate-links) which provides details on how to add alternate links to the sitemap where there are multiple locales available.

In the example below, we have also added `nil` to the locales, in order to generate the sitemap for all the available locales, but also with no locale specified. This can be used as inspiration, but the requirements will differ for every project.

```ruby
# frozen_string_literal: true

require 'sitemap_helper'

SitemapGenerator::Sitemap.default_host = 'http://www.renuo.ch'
SitemapGenerator::Sitemap.include_root = false # this stops homepage being duplicated

SitemapGenerator::Sitemap.create do
  # added nil to produce renuo.ch/path as well as renuo.ch/en/path and renuo.ch/de/path
  locales = [nil, *I18n.available_locales]

  locales.each do |locale|
    add(root_path(locale: locale),
        changefreq: 'weekly', priority: 1.0,
        alternates: alternate_tags(root_path))
    add(blogs_path(locale: locale),
        changefreq: 'weekly', priority: 0.9,
        alternates: alternate_tags(blogs_path))
    # ...
  end
end
```

## Bin script

Once this has been implemented and tested, we can add a `./bin/generate_sitemap` script which will generate the sitemap, unzip it and overwrite the existing files. This script can be used locally to generate the sitemap, but it will also be used by the GitHub Action to generate the sitemap and push it to a new pull request.

```sh
#!/bin/sh
rake sitemap:refresh:no_ping --trace
gunzip -kf public/sitemap.xml.gz
xmllint --format public/sitemap.xml -o public/sitemap.xml
```

## GitHub Action

The GitHub Action is setup in the `.github/workflows/generate_sitemap.yml` file. The below example is configured to run on the 1st of each month, or on a push to main. It will run the `./bin/generate_sitemap` script, and then push the changes to a new pull request.

Please configure this file as required for your project.

```yml
# Run monthly on 1st of each month OR when there's a push to main
on:
  schedule:
    - cron: '0 0 1 * *'
  workflow_dispatch:
  push:
    branches:
      - main

jobs:
  generate_sitemap:
    runs-on: ubuntu-22.04
    env:
      GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      RAILS_MASTER_KEY: ${{ secrets.RAILS_MASTER_KEY }}
      APP_PORT: ''
      PREVIEW_MODE: ''
      LIVE_MODE: ''
      APP_HOST: ''
      MAIL_SENDER: ''
      MAIL_HOST: ''
      MAIL_USERNAME: ''
      MAIL_PASSWORD: ''
      CONTACT_EMAIL: ''

    steps:
      - name: Checkout the repo
        uses: actions/checkout@v3

      - name: Set up Ruby 3.1.2
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: 3.1.2

      - name: Install dependencies
        run: |
          gem install bundler
          bundle install --jobs 4 --retry 3

      - name: Install xmllint
        run: |
          sudo apt-get update -qy
          sudo apt-get install -y libxml2-utils

      - name: Setup Git config
        run: |
          git config user.name "GitHub Actions Bot"
          git config user.email "github-actions[bot]@users.noreply.github.com"

      - name: Generate sitemap
        run: ./bin/generate_sitemap

      - name: Set branch name
        run: |
          echo "BRANCH_NAME=sitemap-github-action-$(date +'%Y-%m-%d')" >> $GITHUB_ENV

      - name: Create PR
        uses: peter-evans/create-pull-request@v4
        with:
          commit-message: Generate sitemap automatically using Github Action
          title: Github Actions - Automatically Generate Sitemap
          body: |
            This PR was automatically created by Github Actions to regenerate the sitemap.
            Please review and merge to develop.
          base: develop
          branch: ${{ env.BRANCH_NAME }}
```
You will need to customise the `env` section to include all the environment variables required for your project.

You may also need to add environment variables in the GitHub repository settings. These can be added in the `Settings > Secrets and variables > Actions` section. In the above case, we only added the `RAILS_MASTER_KEY` in order to access the Rails credentials, the rest are dummy variables.

## Testing

You will also want to add tests to make sure that the sitemap is generated correctly. You can see an example [here](https://github.com/renuo/renuo-website-v3/blob/develop/spec/services/sitemap_spec.rb).

It is also advised to add a test which checks all routes in the application are included in the sitemap. This will alert developers to update the `sitemap.rb` file if they have added a new page. This can be done by adding the following to the `sitemap_spec.rb` file:

```ruby
  let(:skipped_paths) { %w[active_storage admin 404 500 jobs/challenge challenge_submissions] }

  it 'includes all Rails routes in the sitemap' do
    Rails.application.routes.routes.each do |route|
      url = route.path.spec.to_s
      next unless url.include?('locale') && skipped_paths.none? { |skip| url.include?(skip) }

      cleaned_route = url.gsub(%r{(/?:locale)?(\.:format)?}, '')
      final_route = cleaned_route.gsub(/\(\)|:slug/, '')

      expect(sitemap).to include final_route
    end
  end
```

Please customise the `skipped_paths` array to include any routes that should not be included in the sitemap.
