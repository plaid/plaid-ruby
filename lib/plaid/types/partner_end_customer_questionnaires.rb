# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The questionnaires for the end customer.
    class PartnerEndCustomerQuestionnaires < Internal::Types::Model
      field :cra, -> { Plaid::Types::PartnerEndCustomerCraQuestionnaire }, optional: true, nullable: false
    end
  end
end
