require 'test_helper'

# The test for Plaid::Risk.
class PlaidRiskTest < MiniTest::Test
  def test_initialization
    assert_equal 0.79, risk.score
    assert_equal 0.38, risk.reason[:zero_count]
    assert_equal 0.75, risk.reason[:ratio_low_average]
    assert_equal 0.73, risk.reason[:high_risk_class_txns]
    assert_equal 0.4, risk.reason[:bank_transfers]
    assert_equal 0.65, risk.reason[:benfords_law]
    assert_equal 0.78, risk.reason[:transaction_amounts]
    assert_equal 0.96, risk.reason[:foreign_fees]
    assert_equal 0.64, risk.reason[:fraction_bank_fees]
    assert_equal 0.94, risk.reason[:additional_risk_class_txns]
  end

  def test_string_representation
    s = '#<Plaid::Risk score=0.79, ...'
    assert_equal s, risk.to_s
    assert_equal s, risk.inspect
  end

  private

  def risk
    @risk ||= Plaid::Risk.new(risk_data)
  end

  def risk_data
    {
      'reason' => {
        'zero_count' => 0.38,
        'ratio_low_average' => 0.75,
        'high_risk_class_txns' => 0.73,
        'bank_transfers' => 0.4,
        'benfords_law' => 0.65,
        'transaction_amounts' => 0.78,
        'additional_risk_class_txns' => 0.94,
        'foreign_fees' => 0.96,
        'fraction_bank_fees' => 0.64
      },
      'score' => 0.79
    }
  end
end
