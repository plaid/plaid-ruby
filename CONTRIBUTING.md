## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1.  Make one or more atomic commits, and ensure that each commit has a
    descriptive commit message. Commit messages should be line wrapped
    at 72 characters.

2.  Make sure that there are tests for the code you wrote.

3.  Make sure that you've documented all public methods using [TomDoc](http://tomdoc.org/).

4.  Run `rake test`, and address any errors. Preferably, fix commits
    in place using `git rebase` or `git commit --amend` to make the
    changes easier to review.

5.  Open a pull request.
