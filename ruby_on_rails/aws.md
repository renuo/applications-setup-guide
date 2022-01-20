# Amazon Services

## Amazon S3

S3 is Amazon's Simple Cloud Storage Service‎, and used in most of your projects to store images and
files.

## Amazon CloudFront

CloudFront is a large scale, global, and feature rich CDN. We mostly use it together with S3, since fetching
data from S3 is only possible together with CloudFront. You could also host a Single Page Application (SPA),
but for that, we most often use Google Firebase.

## Setup

### Preconditions

#### renuo-cli

You will need Renuo-CLI to be set up and at the newest version:

`gem install renuo-cli` --> see [renuo-cli](https://github.com/renuo/renuo-cli)

Make sure `renuo -v` shows the [newest version](https://github.com/renuo/renuo-cli/tags)

#### aws-cli

Retrieve the credentials "AWS Profile 'renuo-app-setup' for s3 setup" from the password manager at first (or ask _wg-operations_ for help).

You'll need to use `aws-cli`. You can either just continue with "Start the Setup". The command will ensure that everything is set up properly.
Or you can install it manually:

```
brew install awscli
aws configure --profile renuo-app-setup
```

If you want to check your config, run `aws configure --profile renuo-app-setup list`.

### Start the Setup

The following command will create command-line-commands to set up S3 and CloudFront.

1. Run `renuo create-aws-project`
1. Follow the steps and answer the questions
1. Now it will print you out a series of commands e.g.:

```sh
# AWS main

      aws --profile renuo-app-setup iam create-user --user-name <<your-project>>
      [...]

# AWS develop
[...]
```

1. Copy and run the commands environment per environment. After each environment,
it will print you out the credentials as a `json`. Copy `SecretAccessKey` and `AccessKeyId` to
your credentials store:

```json
{
  "AccessKey": {
      "UserName": "***",
      "Status": "***",
      "CreateDate": "***",
      "SecretAccessKey": "*** STORE THIS KEY ***",
      "AccessKeyId": "*** STORE THIS KEY ***"
  }
}
```

1. Repeat the previous step for all environments
1. (Only if using CloudFront) Make sure, you know also the Domain name of your CloudFront-Distribution to access your s3 files
(e.g. ***.cloudfront.net or the Alias, if using an Alias).

You then can use an _ActiveStorage_ configuration like this:

```yaml
amazon:
  service: S3
  access_key_id: <%= ENV['AWS_S3_ACCESS_KEY_ID'] %>
  secret_access_key: <%= ENV['AWS_S3_SECRET_ACCESS_KEY'] %>
  bucket: <%= ENV['AWS_S3_BUCKET'] %>
  region: "eu-central-1"
```
