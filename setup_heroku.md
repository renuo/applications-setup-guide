# Setup Heroku Application

It's time to setup a new Heroku Application.
If you don't know what is Heroku please [read it](https://www.heroku.com/platform).

You should have an Heroku Account already. Under the renuo-cli project you can find [a script](https://github.com/renuo/renuo-cli/blob/develop/lib/renuo/cli/app/create_heroku_app)
to generate a script which will create all Heroku apps.
Please review the script before running it and execute only the commands you need and understand.
If you don't know what a command does: read the documentation and then execute it.

If you think that the script is outdated please open a Pull Request.

## Creating a pipeline

Once you have created *Heroku* apps for develop, master and testing, add them to a new pipeline with the same name as your
application.

![](images/heroku/add_to_pipeline.png)
