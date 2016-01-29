#!/usr/bin/env ruby

require 'securerandom'

# general
puts 'Please enter the applications name: '
app_name=gets

# newrelic
puts 'Please enter the newrelic license key: '
new_relic_license_key=gets

# devise
puts 'Please enter the devise password for develop/testing: '
develop_testing_password=gets

puts 'Please enter the devise password for master: '
master_password=gets

#mandrill configuration
puts 'Please enter the Mail Password (MAIL_PASSWORD): '
mail_password=gets

#s3 configuration
puts 'Please enter the AWS_ACCESS_KEY_ID (leave blank if you don\'t plan to use s3): '
aws_access_key_id=gets

unless aws_access_key_id.blank?
  puts 'Please enter the AWS_SECRET_ACCESS_KEY: '
  aws_secret_access_key=gets
end

#monitoring configuration
puts 'Please enter the Google Analytics ID for the master here: '
ga_id_master=gets

puts 'Please enter the Google Analytics ID for the develop here: '
ga_id_develop=gets

puts 'Please enter the Google Analytics ID for the testing here: '
ga_id_testing=gets

puts 'Please enter the sentry dsn for the master env (it starts with https://...): '
sentry_dsn_master=gets
puts 'Please enter the sentry public dsn for the master env (it starts with https://...): '
sentry_public_dsn_master=gets

puts 'Please enter the sentry dsn for the develop env (it starts with https://...): '
sentry_dsn_develop=gets
puts 'Please enter the sentry public dsn for the develop env (it starts with https://...): '
sentry_public_dsn_develop=gets

puts 'Please enter the sentry dsn for the testing env (it starts with https://...): '
sentry_dsn_testing=gets
puts 'Please enter the sentry public dsn for the testing env (it starts with https://...): '
sentry_public_dsn_testing=gets

s3_host_name = ''

#output
puts
puts 'Configuration for master env: '
puts '================================='
puts "heroku config:set MAIL_USERNAME='mandrill+#{app_name.strip}@renuo.ch' \\"
puts "  MAIL_PASSWORD='#{mail_password.strip}' \\"
puts "  MAIL_SENDER='mandrill+#{app_name.strip}+master@renuo.ch' \\"
puts "  ASSET_HOST='#{app_name.strip}-master-assets.renuoapp.ch' \\"
puts "  APP_HOST='#{app_name.strip}-master.renuoapp.ch' \\"
puts "  APP_PORT='443' \\"
puts "  SECRET_KEY_BASE='#{SecureRandom.hex(64)}' \\"
puts "  DEVISE_SECRET_KEY='#{SecureRandom.hex(64)}' \\"
puts "  DEVISE_PEPPER='#{SecureRandom.hex(64)}' \\"
puts "  NEW_RELIC_LICENSE_KEY='#{new_relic_license_key}' \\"
puts "  NEW_RELIC_APP_NAME='#{app_name.strip}-master' \\"
puts "  SENTRY_DSN='#{sentry_dsn_master.strip}' \\"
puts "  SENTRY_PUBLIC_DSN='#{sentry_public_dsn_master.strip}' \\"
puts "  ADMIN_EMAIL='mandrill+#{app_name.strip}+master@renuo.ch' \\"
puts "  ADMIN_PASSWORD='#{master_password.strip}' \\"
puts "  GOOGLE_ANALYTICS_ID='#{ga_id_master.strip}' \\"
unless aws_access_key_id.blank?
  puts "  S3_BUCKET_NAME='#{app_name.strip}-master' \\"
  puts "  S3_HOST_NAME='#{s3_host_name.strip}' \\"
  puts "  AWS_ACCESS_KEY_ID='#{aws_access_key_id.strip}' \\"
  puts "  AWS_SECRET_ACCESS_KEY='#{aws_secret_access_key.strip}' \\"
end
puts "  BUNDLE_WITHOUT='development:test:lint'"

puts
puts 'Configuration for develop env: '
puts '================================='
puts "heroku config:set MAIL_USERNAME='mandrill+#{app_name.strip}@renuo.ch' \\"
puts "  MAIL_PASSWORD='#{mail_password.strip}' \\"
puts "  MAIL_SENDER='mandrill+#{app_name.strip}+develop@renuo.ch' \\"
puts "  ASSET_HOST='#{app_name.strip}-develop-assets.renuoapp.ch' \\"
puts "  APP_HOST='#{app_name.strip}-develop.renuoapp.ch' \\"
puts "  APP_PORT='443' \\"
puts "  SECRET_KEY_BASE='#{SecureRandom.hex(64)}' \\"
puts "  DEVISE_SECRET_KEY='#{SecureRandom.hex(64)}' \\"
puts "  DEVISE_PEPPER='#{SecureRandom.hex(64)}' \\"
puts "  NEW_RELIC_LICENSE_KEY='#{new_relic_license_key}' \\"
puts "  NEW_RELIC_APP_NAME='#{app_name.strip}-develop' \\"
puts "  SENTRY_DSN='#{sentry_dsn_develop.strip}' \\"
puts "  SENTRY_PUBLIC_DSN='#{sentry_public_dsn_develop.strip}' \\"
puts "  ADMIN_EMAIL='mandrill+#{app_name.strip}+develop@renuo.ch' \\"
puts "  ADMIN_PASSWORD='#{develop_testing_password.strip}' \\"
puts "  GOOGLE_ANALYTICS_ID='#{ga_id_develop.strip}' \\"
unless aws_access_key_id.blank?
  puts "  S3_BUCKET_NAME='#{app_name.strip}-develop' \\"
  puts "  S3_HOST_NAME='#{s3_host_name.strip}' \\"
  puts "  AWS_ACCESS_KEY_ID='#{aws_access_key_id.strip}' \\"
  puts "  AWS_SECRET_ACCESS_KEY='#{aws_secret_access_key.strip}' \\"
end
puts "  BUNDLE_WITHOUT='development:test:lint'"

puts
puts 'Configuration for testing env: '
puts '================================='
puts "heroku config:set MAIL_USERNAME='mandrill+#{app_name.strip}@renuo.ch' \\"
puts "  MAIL_PASSWORD='#{mail_password.strip}' \\"
puts "  MAIL_SENDER='mandrill+#{app_name.strip}+testing@renuo.ch' \\"
puts "  ASSET_HOST='#{app_name.strip}-testing-assets.renuoapp.ch' \\"
puts "  APP_HOST='#{app_name.strip}-testing.renuoapp.ch' \\"
puts "  APP_PORT='443' \\"
puts "  SECRET_KEY_BASE='#{SecureRandom.hex(64)}' \\"
puts "  DEVISE_SECRET_KEY='#{SecureRandom.hex(64)}' \\"
puts "  DEVISE_PEPPER='#{SecureRandom.hex(64)}' \\"
puts "  NEW_RELIC_LICENSE_KEY='#{new_relic_license_key}' \\"
puts "  NEW_RELIC_APP_NAME='#{app_name.strip}-testing' \\"
puts "  SENTRY_DSN='#{sentry_dsn_testing.strip}' \\"
puts "  SENTRY_PUBLIC_DSN='#{sentry_public_dsn_testing.strip}' \\"
puts "  ADMIN_EMAIL='mandrill+#{app_name.strip}+testing@renuo.ch' \\"
puts "  ADMIN_PASSWORD='#{develop_testing_password.strip}' \\"
puts "  GOOGLE_ANALYTICS_ID='#{ga_id_testing.strip}' \\"
unless aws_access_key_id.blank?
  puts "  S3_BUCKET_NAME='#{app_name.strip}-testing' \\"
  puts "  S3_HOST_NAME='#{s3_host_name.strip}' \\"
  puts "  AWS_ACCESS_KEY_ID='#{aws_access_key_id.strip}' \\"
  puts "  AWS_SECRET_ACCESS_KEY='#{aws_secret_access_key.strip}' \\"
end
puts "  BUNDLE_WITHOUT='development:test:lint'"

puts
puts 'Be sure to review the information above for potential TODOs and mistakes that need correcting before sending you document on.'

