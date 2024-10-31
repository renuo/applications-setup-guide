# Github Actions

At Renuo we use SemaphoreCI for our projects for historical reasons and because at the time of writing it
has a slimmer and simpler configuration, faster servers available, and a clear separation and overview over server deployment statuses.

Nevertheless, we have cases where we might need to use Github Actions, one example is [seme.li](https://github.com/renuo/seme.li).

Another case is pulbic, open source libraries, where Github Actions allows to define build grids, while SemaphoreCI does not offer this option.

Here we provide two very basic templates for the continuous integration and continuous deployment configuration:

```yml
# .github/workflows/test.yml
# this file is used to run the tests
name: test
on:
  push:
    branches:
      - '*'
  pull_request:
    branches:
      - '*'
jobs:
  test:
    runs-on: ubuntu-latest    
    steps:
      - name: Download source
        uses: actions/checkout@v4
      - name: Install Dependencies
        run: |
          apt-get update
          apt-get install -y MORE PACKAGES HERE              
      - name:
        run: bin/check

```

```yml
# .github/workflows/deploy.yml
# this file is used to release

name: deploy

on:
  workflow_run:
    workflows: test
    types: completed
    branches:
      - main

jobs:
  deployment:
    runs-on: ubuntu-latest
    steps:
      - name: Download source
        uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - name: Push to Heroky    
      - uses: akhileshns/heroku-deploy@v3.13.15       
        with:
          heroku_api_key: ${{secrets.HEROKU_API_KEY}}
          heroku_app_name: "APP_NAME"
          heroku_email: ${{secrets.HEROKU_EMAIL}}
```
