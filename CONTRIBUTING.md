## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Running tests

The gem test suite can be run in two modes. By default, it runs against the
live sandbox environment, creating items on the fly and calling various API
endpoints for them. For this to work you'll need real `client_id`, `secret`,
and `public_key` from your Plaid dashboard. Create a file named `.env`
based on `.env.sample` which is provided:

```text
PLAID_RUBY_CLIENT_ID=the_real_client_id
PLAID_RUBY_SECRET=the_real_secret
PLAID_RUBY_PUBLIC_KEY=the_real_public_key
```
This file will be loaded during the tests.

Another mode employs pre-recorded API responses using the
[vcr](https://github.com/vcr/vcr) gem. It runs much faster. Just use
`rake test_stubbed` and you're good to go even without `.env`!

## Updating VCR "cassettes"

In case you're adding new API endpoints or when there were any substantial
changes in API you'll need to update the pre-recorded responses. Here's how:

1. Make sure that `STUB_API=1 rake test` fails. It will fail saying something
   like "... An HTTP request has been made that VCR does not know how to
   handle".
2. Run `RECORD_MODE=all STUB_API=1 rake test`. This will run the whole suite
   and re-record everything. If you only need to update data for one test class,
   use this:

   ```
   RECORD_MODE=all STUB_API=1 ruby -w -I"lib:test" -rminitest/pride -rdotenv/load test/test_which_fails.rb
   ```
3. Run `rake vcr_hide_credentials`. This step is essential, because
   newly recorded files will contain your real `client_id` and friends. This
   Rake task will go over all recorded files and replace real values with
   stubbed ones used by `STUB_API=1 rake test`.
4. Run `STUB_API=1 rake test` and verify that everything works.

## Contributing

1.  Make one or more atomic commits, and ensure that each commit has a
    descriptive commit message. Commit messages should be line wrapped
    at 72 characters.

2.  Make sure that there are tests for the code you wrote.

3.  Make sure that you've documented all public methods using [TomDoc](http://tomdoc.org/).

4.  Run tests (in both modes, see above) and address any errors. Preferably,
    fix commits in place using `git rebase` or `git commit --amend` to make the
    changes easier to review.

5.  Open a pull request.
