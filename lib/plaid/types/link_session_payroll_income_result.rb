# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The details of a digital payroll income verification in Link.
    class LinkSessionPayrollIncomeResult < Internal::Types::Model
      field :num_paystubs_retrieved, -> { Integer }, optional: false, nullable: false

      field :num_w2s_retrieved, -> { Integer }, optional: false, nullable: false

      field :institution, -> { Plaid::Types::LinkSessionSuccessMetadataInstitution }, optional: false, nullable: true
    end
  end
end
