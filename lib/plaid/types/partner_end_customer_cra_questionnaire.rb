# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The CRA questionnaire for the end customer.
    class PartnerEndCustomerCraQuestionnaire < Internal::Types::Model
      field :purposes, -> { Plaid::Types::PartnerEndCustomerCraPurposes }, optional: true, nullable: false

      field :is_third_party_involved, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :is_technical_service_provider_involved, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
