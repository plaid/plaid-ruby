# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Parent container for name that allows for choice group between parsed and unparsed containers.
    class IndividualName < Internal::Types::Model
      field :first_name, -> { String }, optional: false, nullable: false, api_name: "FirstName"

      field :last_name, -> { String }, optional: false, nullable: false, api_name: "LastName"
    end
  end
end
