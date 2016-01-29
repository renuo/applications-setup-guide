# Initial Deployment

## Config Prepare

Prepare 3 lists with the config for each production env: develop/master/testing. Define every config which is defined in https://redmine.renuo.ch/projects/internal/wiki/Application_Configuration#configapplicationexampleyml. This should look like:

```
# master
heroku config:set MAIL_USERNAME="..."
heroku config:set MAIL_PASSWORD="..."
heroku config:set APP_HOST="<application>-<branch>.renuoapp.ch"
heroku config:set APP_PORT="443"
...
...
...
# develop
...
...
# testing
...
...
```

Write this data into the credential store of the corresponding project.

### Script

Feel free to use the following script to spare yourself some writing time. It generates the necessary Heroku commands for you (but beware: maybe you want to edit the script before you execute it: TODO: link to the config script):

```
# TODO: link to the heroku-config-script.rb
cd /tmp
wget https://github.com/ ... /heroku-config-script.rb
vim heroku-config-script.rb
ruby heroku-config-script.rb
```

## Start

Ask someone with access (the "sysadmin") to help setup the app. Tell him the <application> name. He already has your config.

Then do (with the one who has access)

```
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

```
cd ~/deployments/<application>-master
# execute the commands from your list (only for master)
```

## Initial Deployment onto *master*

Once these commands are generated, run

```
cd ~/deployments/<application>-master
git push heroku master
```

This will init the initial deployment. If there are no errors, you're good to go :)

## Config Execution for *develop and testing*

This is only about configuration and not yet about deployment. Auto-deployments won't work for other branches than master because they don't exist yet.

```
cd ~/deployments/<application>-develop
# execute the deployment config for develop
cd ~/deployments/<application>-testing
# execute the deployment config for testing
```