# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Configuration parameters for EU flows
    class LinkTokenEuConfig < Internal::Types::Model
      field :headless, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
