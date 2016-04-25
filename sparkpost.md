# SparkPost

Only needed when you need to send mails.

There are two options to set up SparkPost:

* With a domain for the project (preferred, if possible)
* Without an exisiting domain ==> via %app_name%.renuoapp.ch subdomain

**Note:** With the second option, you are only able to send mails from %app_name%.renuoapp.ch

*There should only be one sparkpost account per project. That means, that the master, develop & testing all use the same one.*

1. Go to https://app.sparkpost.com/sign-up/ and create a *new* account
2. Use the email sparkpost+%app_name%@renuo.ch
3. Use ```renuo generate-password``` to generate a secure password
4. Copy the credentials  to the wiki
5. Fill in the domain you plan to use, otherwise fill in %app_name%.renuoapp.ch (you can add others also afterwards)
6. Confirm your account (sent to sparkpost@renuo.ch)
7. Note down the API-key, because it's only shown once!
8. You can check your key under: https://app.sparkpost.com/account/credentials
9. Validate your sending domain under https://app.sparkpost.com/account/sending-domains  
(SPF DKIM method recommended)

For DNS setup see [Go Live](go_live.md)
