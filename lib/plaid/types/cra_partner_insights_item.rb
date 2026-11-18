# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The details and metadata for an end user's Item.
    class CraPartnerInsightsItem < Internal::Types::Model
      field :institution_id, -> { String }, optional: true, nullable: false

      field :institution_name, -> { String }, optional: true, nullable: false

      field :item_id, -> { String }, optional: true, nullable: false

      field :accounts, -> { Internal::Types::Array[Plaid::Types::CraPartnerInsightsItemAccount] }, optional: true, nullable: false
    end
  end
end
