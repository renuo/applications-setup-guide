# SparkPost

Only needed when you need to send mails.

There are two options to set up SparkPost:

* With a domain for the project and a separate SparkPost account (preferred, if possible)
* Without an exisiting domain ==> via renuoapp.ch SparkPost account

**Note:** With the second option, you are only able to send mails with **####@renuoapp.ch** as your mail sender


### First Option

*There should only be one sparkpost account per project. That means, that the master, develop & testing all use the same one.*

1. Go to https://app.sparkpost.com/sign-up/ and create a *new* account
2. Use the email ```sparkpost+%app_name%@renuo.ch``` as your username
3. Use ```renuo generate-password``` to generate a secure password
4. Copy the credentials into the credential store
5. Fill in the domain you plan to use
6. Confirm your email address (sent to sparkpost@renuo.ch)
  1. Hint: https://groups.google.com/a/renuo.ch/forum/#!topic/mandrill
7. Write down the API-key in the credential store, because it's only shown once!
8. You can check your key under: https://app.sparkpost.com/account/credentials
9. Validate your sending domain [here](https://app.sparkpost.com/account/sending-domains), or add it if not already done (Set up SPF & DKIM with TXT DNS records)
10. Credentials for SMTP setup on your app can be found [here](https://app.sparkpost.com/account/smtp), password is your generated API-key
11. Set up your ENV-variables and test if the mails are working. Manual mails can be send via the following command in the rails console: `ActionMailer::Base.mail(to: 'yourname@renuo.ch', subject: 'Testmail', body: 'Mail content').deliver_now!` (disable letter opener temporarily!)

For DNS setup also see [Go Live](go_live.md)

##### Example ENV-variables

```
MAIL_USERNAME: 'SMTP_Injection'
MAIL_PASSWORD:  'YOUR API KEY'
MAIL_HOST: 'smtp.sparkpostmail.com'
MAIL_SENDER: 'Sample App <sample-app@yourdomain.tld>'
```

### Second Option

1. Go to https://app.sparkpost.com/auth and log in with the credentials found in the credential store
2. Create [one new subaccount](https://app.sparkpost.com/account/subaccounts) and name it like your project
3. Create [a new API-Key for your subaccount](https://app.sparkpost.com/account/credentials), with the following permissions: *Send via SMTP, Sending Domains: Read/Write*
4. Write down the API-key in the credential store, because it's only showed once!
5. Credentials for SMTP setup on your app can be found [here](https://app.sparkpost.com/account/smtp), password is your generated API-key
6. Set up your ENV-variables and test if the mails are working. Manual mails can be send via the following command in the rails console: `ActionMailer::Base.mail(to: 'yourname@renuo.ch', subject: 'Testmail', body: 'Mail content').deliver_now!` (disable letter opener temporarily!)

##### Example ENV-variables

```
MAIL_USERNAME: 'SMTP_Injection'
MAIL_PASSWORD:  'YOUR API KEY'
MAIL_HOST: 'smtp.sparkpostmail.com'
MAIL_SENDER: 'Sample App <sample-app@renuoapp.ch>'
```

