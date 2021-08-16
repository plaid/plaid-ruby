# Publishing

The module is published to [RubyGems][1] under the gem name [plaid][2].

Prepare release:

1. Update `Makefile -> RUBY_PACKAGE_VERSION`, and `CHANGELOG.md` files.
2. Run `bundle` to bump the version in `Gemfile.lock`.
3. Create and merge a PR with the changes from 1 and 2.
4. Authenticate with rubygems with `gem signin` or manually set up your `~/.gem/credentials`.

Publish:

1. `git checkout master` and `git pull` (makes sure your `HEAD` is up-to-date).
2. Check that tests are passing on latest `master` build and (optional) `docker build -t plaid-ruby . && docker run -e PLAID_RUBY_CLIENT_ID=$(CLIENT_ID) -e PLAID_RUBY_SECRET=$(SECRET) plaid-ruby)` run tests locally.
3. `bundle exec rake release` (builds the gem, creates a tag, pushes the gem to RubyGems and tag to GitHub). **NOTE:** if this step hangs indefinitely, you need to set your MFA settings to "UI Only" [here](https://rubygems.org/profile/edit).

[1]: https://rubygems.org/
[2]: https://rubygems.org/gems/plaid
