# VCR

VCR is a gem for recording HTTP requests to external services and replaying them. A VCR setup should be very specifically tied to
the tests which need VCR because it's quite expensive.

Here's an article on about some tweaks which can be made to a VCR setup: https://blog.arkency.com/3-tips-to-tune-your-vcr-in-tests/

Also consider re-recording often (maybe nightly on the CI?) because out-of-date replays give you a false sense of safety.
