# Publishing

The module is published to [RubyGems][1] under the gem name [plaid][2].

Prepare release:

1. update `lib/plaid/version.rb`, and `CHANGELOG.md` files.
2. run `bundle` to bump the version in `Gemfile.lock`
3. create and merge a PR with the changes from 1 and 2.
4. authenticate with rubygems with `gem signin` or manually set up your `~/.gem/credentials`

Publish:

1. `git checkout master` and `git pull` (makes sure your `HEAD` is up-to-date).
2. Check that tests are passing on latest `master` build and (optional) `bundle exec rake test` to run tests locally
3. `bundle exec rake release` (builds the gem, creates a tag, pushes the gem to RubyGems and tag to GitHub). **NOTE:** if this step hangs indefinitely, you need to set your MFA settings to "UI Only" [here](https://rubygems.org/profile/edit)

[1]: https://rubygems.org/
[2]: https://rubygems.org/gems/plaid
