# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class CreditFreddieMacIndividualName < Internal::Types::Model
      field :first_name, -> { String }, optional: false, nullable: false, api_name: "FirstName"

      field :last_name, -> { String }, optional: false, nullable: false, api_name: "LastName"

      field :middle_name, -> { String }, optional: false, nullable: false, api_name: "MiddleName"
    end
  end
end
