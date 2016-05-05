require 'test_helper'

# The test for Plaid::Income.
class PlaidIncomeTest < MiniTest::Test
  # include TestHelpers

  def test_single_attributes
    assert_equal 56_000, income.last_year_income
    assert_equal 87_500, income.last_year_income_before_tax
    assert_equal 63_000, income.projected_yearly_income
    assert_equal 97_520, income.projected_yearly_income_before_tax

    assert_equal 1, income.max_number_of_overlapping_income_streams
    assert_equal 2, income.number_of_income_streams
  end

  def test_string_representation
    str = '#<Plaid::Income last_year_income=56000, projected_yearly_income=' \
            '63000, number_of_income_streams=2, ...>'
    assert_equal str, income.to_s
    assert_equal str, income.inspect
  end

  def test_streams
    assert_equal 2, income.income_streams.size

    i1 = income.income_streams[0]
    assert_equal 5250, i1.monthly_income
    assert_equal 1.0, i1.confidence
    assert_equal 284, i1.days
    assert_equal 'PLAID', i1.name

    i2 = income.income_streams[1]
    assert_equal 2400, i2.monthly_income
    assert_equal 0.95, i2.confidence
    assert_equal 415, i2.days
    assert_equal 'BAGUETTES INC', i2.name
  end

  def test_stream_string_representation
    i = income.income_streams[0]

    s = '#<Plaid::Income::Stream name="PLAID", monthly_income=5250, ' \
          'confidence=1.0, days=284>'
    assert_equal s, i.to_s
    assert_equal s, i.inspect
  end

  private

  def income
    @income ||= Plaid::Income.new(income_data)
  end

  def income_data
    {
      'income_streams' => [
        {
          'monthly_income' => 5250,
          'confidence' => 1.0,
          'days' => 284,
          'name' => 'PLAID'
        },
        {
          'monthly_income' => 2400,
          'confidence' => 0.95,
          'days' => 415,
          'name' => 'BAGUETTES INC'
        }
      ],
      'last_year_income' => 56_000,
      'last_year_income_before_tax' => 87_500,
      'projected_yearly_income' => 63_000,
      'projected_yearly_income_before_tax' => 97_520,
      'max_number_of_overlapping_income_streams' => 1,
      'number_of_income_streams' => 2
    }
  end
end
