# Ruby embeds the version in the generator where as others don't so it's not possible to cat for it.
RUBY_PACKAGE_VERSION=14.11.1

.PHONY: release
# Remove previously released versions of plaid-ruby
	rm -rf pkg
# Release
	bundle exec rake release
