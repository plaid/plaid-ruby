# Publishing

The module is published to [RubyGems][1] under the gem name [plaid][2].

The publishing process is handled by [xyz][3] and is exposed as a [Makefile][4] target.

To publish:

1. `rake test` (runs the test suite locally).
2. Update the `lib/plaid/version.rb` file. 
3. Update the `CHANGELOG` file if there is any.
4. Commit version and CHANGELOG changes (get the corresponding PR merged).
5. `git pull` (makes sure your `HEAD` is up-to-date).
6. `rake release` (builds the gem, creates a tag, pushes the gem to RubyGems and tag to GitHub).
7. `rake update_github_docs` (generates RDoc files, updates `gh-pages` branch and pushes it to GitHub).

[1]: https://rubygems.org/
[2]: https://rubygems.org/gems/plaid
