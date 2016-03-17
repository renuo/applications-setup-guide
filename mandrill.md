# Mandrill

Only needed when you need to send mails.

There should only be one mandrill account per project. That means, that the master, develop & testing all use the same one.

1. Go to https://mandrill.com/signup/ and create a *new* account
2. Use the email mandrill+<app_name>@renuo.ch
3. Use ```renuo generate-password``` to generate secure password
4. Proceed by creating a new API_KEY at https://mandrillapp.com/settings/index/
5. Write down the api key, you will need it to configure heroku
