# SparkPost

Each app is using a separate subaccount under the main SparkPost accounts
- sparkpost+master@renuo.ch
- sparkpost+develop@renuo.ch
- sparkpost+testing@renuo.ch

There are two paths when setting up the project on SparkPost:

* The domain is known: it should be set up and verified under the subaccount's sending domains.
* The domain is not known: the emails will be sent with **\*@renuoapp.ch** as your mail sender

:warning:
Always use subaccounts for the project, so that the whole account doesn't get suspended / blocked in case of compliance issues!

1. Go to <https://app.sparkpost.com/auth> and log in with the credentials for
   sparkpost+<enviroment>@renuo.ch found in the credential store
1. Create [one new subaccount](https://app.sparkpost.com/account/subaccounts) and name it like your project
1. Create [a new API-Key for your subaccount](https://app.sparkpost.com/account/api-keys/create) and assign it to the new subaccount, with the following permissions: *Send via SMTP, Sending Domains: Read/Write*
1. Write down the API-key in the credential store (in a list under sparkpost+<enviroment>@renuo.ch), because it's only showed once!
1. Credentials for SMTP setup on your app can be found [here](https://app.sparkpost.com/account/smtp), password is your generated API-key
1. (if domain is known) Add your sending domain [here](https://app.sparkpost.com/domains/create?type=sending). Assign it to the subaccount. Set up SPF & DKIM with TXT DNS records
1. Set up your ENV-variables and test if the mails are working. Manual test emails can be send via the following command in the rails console (production environment): `ActionMailer::Base.mail(to: 'yourname@renuo.ch', subject: 'Testmail', body: 'Mail content').deliver_now!`

For DNS setup also see [Go Live](go_live.md)

ENV-variables example:

```
MAIL_USERNAME: 'SMTP_Injection'
MAIL_PASSWORD:  'YOUR API KEY'
MAIL_HOST: 'smtp.sparkpostmail.com'
MAIL_SENDER: 'Sample App <sample-app@renuoapp.ch>'
```

Or with a custom domain:

```
MAIL_SENDER: 'Sample App <sample-app@yourdomain.tld>'
```

