# SparkPost

Only needed when you need to send mails.

There are two options to set up SparkPost:
* A: With an exisiting domain for the project (see [Go Live](go_live.md) for DNS setup via CloudFlare)
* B: Without an exisiting domain (via subaccount from renuoapp.ch)

There should only be one sparkpost (sub)account per project. That means, that the master, develop & testing all use the same one.

#### A:

1. Go to https://app.sparkpost.com/sign-up/ and create a *new* account
2. Use the email sparkpost+%app_name%@renuo.ch
3. Use ```renuo generate-password``` to generate a secure password
4. Fill in the domain you plan to use and note down the API key, which is shown afterwards.
4. You can check your API-key(s) under: https://app.sparkpost.com/account/credentials if needed
5. Add your sending-domain under https://app.sparkpost.com/account/sending-domains and validate it with the SPF text record.


#### B:

**Note:**  
With this option you are only able to send mails from *.renuoapp.ch  
Otherwise you need your own domain!

1. Go to https://app.sparkpost.com/auth and log in with the credentials found in the wiki
2. Go to https://app.sparkpost.com/account/subaccounts
3. Fill in the required fields, set permissions *"Send via SMTP"* and create a new subaccount with API-key
4. Note down the shown API-key, because it's only shown once and you need it to configure heroku
