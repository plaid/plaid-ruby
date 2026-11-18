# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BusinessDeliveryType
      extend Plaid::Internal::Types::Enum

      STREET = "street"
      FIRM = "firm"
      GENERAL_DELIVERY = "general_delivery"
      HIGH_RISE = "high_rise"
      POST_OFFICE = "post_office"
      RURAL_ROUTE = "rural_route"
    end
  end
end
