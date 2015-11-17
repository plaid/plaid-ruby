# Publishing

The module is published to the [rubygems.org][1] under the gem name [plaid][2].

The publishing process is handled by [rake][3].

After updating the package version, run:

```console
$ rake spec
$ rake build
$ rake release
```

See the [semantic versioning][4] guidelines to determine what level of release to publish.

[1]: https://rubygems.org
[2]: https://rubygems.org/gems/plaid
[3]: https://github.com/ruby/rake
[4]: http://semver.org

