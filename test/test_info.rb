require 'test_helper'

# The test for Plaid::Info.
class PlaidInfoTest < MiniTest::Test
  include TestHelpers

  def setup
    tartan
  end

  def test_initialize
    info = Plaid::Info.new(parsed_info_data)

    assert_equal ['Frodo Baggins', 'Samwise Gamgee'], info.names

    assert_equal [{ data: 'frodo.baggins@plaid.com', type: :primary }],
                 info.emails

    assert_equal [{ data: '111-222-3456', type: :work, primary: false },
                  { data: '123-456-7891', type: :mobile, primary: true }],
                 info.phone_numbers

    assert_equal [{ primary: true, data:
                                    { 'street' => '1 Hobbit Way',
                                      'city' => 'The Shire',
                                      'state' => 'CA',
                                      'zip' => '94108' } }], info.addresses
  end

  def test_string_representation
    info = Plaid::Info.new(parsed_info_data)

    str = '#<Plaid::Info names=["Frodo Baggins", "Samwise Gamgee"], ...>'

    assert_equal str, info.to_s
    assert_equal str, info.inspect
  end

  private

  def parsed_info_data
    {
      'names' => ['Frodo Baggins', 'Samwise Gamgee'],
      'emails' => [{ 'data' => 'frodo.baggins@plaid.com',
                     'type' => 'primary' }],
      'phone_numbers' => [
        { 'data' => '111-222-3456', 'type' => 'work', 'primary' => false },
        { 'data' => '123-456-7891', 'type' => 'mobile', 'primary' => true }],
      'addresses' => [
        { 'primary' => true,
          'data' =>
          { 'street' => '1 Hobbit Way',
            'city' => 'The Shire',
            'state' => 'CA',
            'zip' => '94108' } }] }
  end
end
