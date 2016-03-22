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

Then do (with the one who has access)

```sh
# for rails apps
ssh to the rails deployment server
# for JS apps
ssh to the js deployment server
cd ~/deployments
PROJECT=<application> ./generate-init-script.rb
```

This command generates a list of commands which should be executed. *Execute them one by one, so you can abort if there is an error.*

## Config Execution on *master*

After having set up the heroku apps in the step before you now can configure the heroku environments. You should have a list with commands like "heroku config:set MAIL_USERNAME='mandrill+<app_name>@renuo.ch'" for all three environments. These shall now be executed on the ssh remote host

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
