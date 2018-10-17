require_relative 'helper'
require 'minitest/around'

describe 'Outer' do
  let(:var) { [] }

  before do
    var << :before
  end
  after do
    var << :after
    var.must_equal [:before, :begin, :ibefore, :ibegin, :during, :iend, :iafter, :end, :after]
  end
  around do |test|
    var << :begin
    test.call
    var << :end
  end

  describe 'Inner' do
    before do
      var << :ibefore
    end
    after do
      var << :iafter
    end
    around do |test|
      var << :ibegin
      test.call
      var << :iend
    end
    it 'testing' do
      var << :during
    end
  end
end
