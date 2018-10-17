require 'minitest/test'

require 'minitest/around/version'

Minitest::Test.class_eval do
  alias_method :run_without_around, :run
  def run(*args)
    if defined?(around)
      result = nil
      around { result = run_without_around(*args) }
      result
    else
      run_without_around(*args)
    end
  end
end
