module RavenHelper
  def raven_js
    # :nocov:
    "Raven.config('#{ENV['SENTRY_PUBLIC_DSN']}').install();".html_safe if Rails.env.production?
    # :nocov:
  end
end
