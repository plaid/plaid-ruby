# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains data about the connected Item.
    class CraNetworkInsightsItem < Internal::Types::Model
      field :institution_id, -> { String }, optional: false, nullable: false

      field :institution_name, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false
    end
  end
end
