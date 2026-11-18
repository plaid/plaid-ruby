# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A map containing data to pass in for the Card Switch flow.
    class LinkTokenCreateCardSwitch < Internal::Types::Model
      field :card_bin, -> { String }, optional: false, nullable: false
    end
  end
end
