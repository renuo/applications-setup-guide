# SparkPost

Only needed when you need to send mails.

There should only be one sparkpost account per project. That means, that the master, develop & testing all use the same one.

1. Go to https://app.sparkpost.com/sign-up/ and create a *new* account
2. Use the email sparkpost+%app_name%@renuo.ch
3. Use ```renuo generate-password``` to generate secure password
4. Proceed by creating a new API_KEY at https://app.sparkpost.com/account/credentials
5. Write down the api key, you will need it to configure heroku

TODO: describe domain validation of renuoapp.ch
