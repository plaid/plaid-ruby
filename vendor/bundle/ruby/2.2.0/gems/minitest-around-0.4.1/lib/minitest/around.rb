require 'minitest/around/version'
require 'minitest/around/spec'
require 'minitest/around/unit'

module Minitest
  module Around
    # Ugly hack for cucumber/mt5 combo!
    VERSION = MinitestAround::VERSION
  end
end
