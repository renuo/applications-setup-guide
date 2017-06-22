# Initial Deployment

## Config Prepare

Prepare 3 lists with the config for each production env: develop/master/testing. This should look like.

```sh
# master
heroku config:set MAIL_USERNAME="..."
heroku config:set APP_HOST="<application>-<branch>.renuoapp.ch"
heroku config:set APP_PORT="443"
...
...
# develop
...
...
# testing
...
...
```

The following script will help you achieve that. It generates the necessary Heroku commands for you (beware: depending on your project, you want to edit the script before executing):

```sh
cd /tmp
wget https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/scripts/heroku-config-script.rb
vim heroku-config-script.rb
ruby heroku-config-script.rb
```

Write this data into the credential store of the corresponding project, so that the data can be transferred to the sysadmin safely.

## Start

Ask someone with access (the "sysadmin") to help setup the app. Tell him the <application> name. He already has your config.

Then create the Heroku application with commands that look like the following:

```sh
heroku apps:create --region eu example-master
heroku domains:add example-master.renuoapp.ch --app example-master
heroku addons:create heroku-postgresql --version=9.5 --app example-master
heroku pg:backups:schedule --app example-master
heroku addons:create papertrail
# Now you should add the users to the project
# heroku access:add name.lastname@renuo.ch --app example-master
heroku apps:create --region eu example-develop
heroku domains:add example-develop.renuoapp.ch --app example-develop
heroku addons:create heroku-postgresql --version=9.5 --app example-develop
heroku pg:backups:schedule --app example-develop
heroku addons:create papertrail
# Now you should add the users to the project
# heroku access:add name.lastname@renuo.ch --app example-develop
heroku apps:create --region eu example-testing
heroku domains:add example-testing.renuoapp.ch --app example-testing
heroku addons:create heroku-postgresql --version=9.5 --app example-testing
heroku pg:backups:schedule --app example-testing
heroku addons:create papertrail
# Now you should add the users to the project
# heroku access:add name.lastname@renuo.ch --app example-testing
```

You can generate the commands for your specific application with a script:

```sh
wget https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/scripts/generate-init-script.rb
PROJECT=projectname ruby generate-init-script.rb

# Project that don't need a DB can be generated with this command:
PROJECT=projectwithoutdb NO_DB=true ruby generate-init-script.rb
```

## Config Execution on *master*

After having set up the heroku apps in the step before you now can configure the heroku environments. You should have a list with commands like "heroku config:set MAIL_USERNAME='sparkpost+<app_name>@renuo.ch'" for all three environments. These shall now be executed on the ssh remote host

```sh
cd ~/deployments/<application>-master
# execute the commands from your list (only for master)
```

## Initial Deployment onto *master*

Once these commands are generated, run

```sh
cd ~/deployments/<application>-master
git push heroku master
```

This will init the initial deployment. If there are no errors, you're good to go :)

## Config Execution for *develop and testing*

This is only about configuration and not yet about deployment. Auto-deployments won't work for other branches than master because they don't exist yet.

```sh
cd ~/deployments/<application>-develop
# execute the deployment config for develop and push to heroku
cd ~/deployments/<application>-testing
# execute the deployment config for testing and push to heroku
```
