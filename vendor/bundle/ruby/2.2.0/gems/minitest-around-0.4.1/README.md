[github]: https://github.com/splattael/minitest-around
[doc]: http://rubydoc.info/github/splattael/minitest-around/master/file/README.md
[gem]: https://rubygems.org/gems/minitest-around
[travis]: https://travis-ci.org/splattael/minitest-around
[codeclimate]: https://codeclimate.com/github/splattael/minitest-around
[inchpages]: https://inch-ci.org/github/splattael/minitest-around

# minitest-around

[![Travis](https://img.shields.io/travis/splattael/minitest-around.svg?branch=master)][travis]
[![Gem Version](https://img.shields.io/gem/v/minitest-around.svg)][gem]
[![Code Climate](https://img.shields.io/codeclimate/github/splattael/minitest-around.svg)][codeclimate]
[![Test Coverage](https://codeclimate.com/github/splattael/minitest-around/badges/coverage.svg)][codeclimate]
[![Inline docs](https://inch-ci.org/github/splattael/minitest-around.svg?branch=master&style=flat)][inchpages]

[Gem][gem] |
[Source][github] |
[Documentation][doc]

Around block for minitest 5.X.

Alternative for setup/teardown dance.

## Installation

```Bash
gem install minitest-around
```

## Usage

### Unit tests

```Ruby
require 'minitest/autorun'
require 'minitest/around/unit'
require 'thread'

class MutexTest < Minitest::Test
  def around(&block)
    Mutex.new.synchronize(&block)
  end

  def test_synchronized
    # ...
  end
end
```

### Spec

<!-- example -->
```Ruby
require 'minitest/autorun'
require 'minitest/around/spec'
require 'tmpdir'

describe "inside new directory" do
  around do |test|
    Dir.mktmpdir do |dir|
      @dir = dir
      Dir.chdir(dir) do
        test.call
      end
    end
  end

  it "is in new directory" do
    assert_equal @dir, Dir.pwd.sub("/private/var/", "/var/")
  end
end
```
<!-- example -->

## Multiple before/after blocks

Minitest-around also enables the use of multiple before/after blocks, which normally don't work in minitest.

## Caveats

 - Test bodies won't be run if you don't test.call inside +around+.
 - around runs inside a Fiber, so use `Thread.get_thread_local` / `set_thread_local` instead of `Thread.current.[]`

### Minitest 5.X only

`minitest-around` currently supports only `minitest` 5.X.

Please see the [mt4](https://github.com/splattael/minitest-around/tree/mt4) branch
for `minitest` 4.7.X support.


## License

[MIT License](http://www.opensource.org/licenses/mit-license.php)

## Authors

* [Peter Leitzen](https://github.com/splattael)

## [Contributors](https://github.com/splattael/minitest-around/graphs/contributors)

* [Michael Grosser](https://github.com/grosser)
* [Hendra Uzia](https://github.com/hendrauzia)
* [Rick Martínez](https://github.com/rickmzp)
* [Philip Nelson](https://github.com/pnelson)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Test

```Bash
bundle exec rake test
```

## Release

```Bash
edit lib/minitest/around/version.rb
git commit
rake release
```
