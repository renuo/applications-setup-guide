# Slack and Notifications

If you want to keep your team up-to-date with some notifications about the project and to discuss project-related topics
we suggest you to use [Slack](https://renuo.slack.com/).

You are, for sure, already a member of slack.

## Project Channel

You can create a project-dedicated channel on slack naming it `#project-[project-name]` (e.g. `#project-bookshelf`,
`#project-gifcoins`, etc..).

Invite all team members involved in the project to the channel.

## Deploy Notifications

One notification you may want to receive on this channel is about when a new deployment on master has been performed. In
order to do that you must be an admin of the Renuo Slack Organisation. If you are not an admin, ask wg-operations to do
it for you communicating the `[project-name]`.

:warning: **You must have already setup [Automatic Deployment through SemaphoreCI](ruby_on_rails/configure_cd.md)** :warning:

On Slack:
1. Create a new Custom Integration --> Incoming Webhook
2. Post to the channel `#project-[project-name]`
3. Copy the Webhook URL and note it
4. In "Customize Name" write "Semaphore CI"
5. In "Customize Icon" place this icon: ![semaphore_icon](images/semaphore_icon.png)
6. Save

Now proceed to SemaphoreCI:

1. Open the project Slack notifications settings (`https://semaphoreci.com/renuo/[project-name]/settings/notifications/slack/new`)
2. Paste the Webhook URL
3. Change **Receive after builds** to **Never**
4. Select only the `[project-name]-master` server
5. Include the Project Name
6. Save

> We do not want to pollute the channel with many notifications, therefore we suggest to only send a notification about
> deployments to production. You can configure other notifications, like Email, in the Notifications panel of the
> project on Semaphore CI

You can test the notification using the provided test button.
