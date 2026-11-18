# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Results from the business identity verification check, which matches the submitted business information against
    # data provider records. `officers` is one result for all submitted officers, as reported by the data provider.
    # `registered_agent` compares the submitted officer names against the business's registered agent. Both are
    # `no_input` when no officers were submitted.
    class BusinessVerificationCheck < Internal::Types::Model
      field :status, -> { Plaid::Types::BusinessVerificationStatusBusinessVerificationCheck }, optional: false, nullable: false

      field :score, -> { Integer }, optional: false, nullable: true

      field :name, -> { Plaid::Types::BusinessFieldMatchSummary }, optional: false, nullable: false

      field :address, -> { Plaid::Types::BusinessAddressMatch }, optional: false, nullable: false

      field :website, -> { Plaid::Types::BusinessFieldMatchSummary }, optional: false, nullable: false

      field :tin, -> { Plaid::Types::BusinessTinMatch }, optional: false, nullable: false

      field :officers, -> { Plaid::Types::BusinessFieldMatchSummary }, optional: false, nullable: false

      field :registered_agent, -> { Plaid::Types::BusinessFieldMatchSummary }, optional: false, nullable: false

      field :business_details, -> { Plaid::Types::BusinessDetails }, optional: false, nullable: false
    end
  end
end
