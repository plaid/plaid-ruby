# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The amount of income earned year to date, as based on paystub data.
    class PaystubYtdDetails < Internal::Types::Model
      field :gross_earnings, -> { Float }, optional: true, nullable: true

      field :net_earnings, -> { Float }, optional: true, nullable: true
    end
  end
end
