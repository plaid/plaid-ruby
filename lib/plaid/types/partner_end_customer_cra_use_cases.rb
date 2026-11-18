# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The list of use cases associated with a given permissible purpose.
    class PartnerEndCustomerCraUseCases < Internal::Types::Model
      field :use_cases, -> { Internal::Types::Array[Plaid::Types::PartnerEndCustomerCraUseCase] }, optional: true, nullable: false
    end
  end
end
