# Ruby embeds the version in the generator where as others don't so it's not possible to cat for it.
RUBY_PACKAGE_VERSION=15.2.0

.PHONY: release
release:
# Remove previously released versions of plaid-ruby
	rm -rf pkg
# Release
	bundle config set --local path 'vendor/bundle' && \
	bundle && \
	bundle exec rake release
