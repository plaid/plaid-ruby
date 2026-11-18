# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The details of a bank employment verification in Link.
    class LinkSessionBankEmploymentResult < Internal::Types::Model
      field :status, -> { Plaid::Types::CreditSessionBankEmploymentStatus }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :institution, -> { Plaid::Types::LinkSessionSuccessMetadataInstitution }, optional: false, nullable: true
    end
  end
end
