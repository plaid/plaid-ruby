# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class Roles < Internal::Types::Model
      field :role, -> { Plaid::Types::Role }, optional: false, nullable: false, api_name: "ROLE"
    end
  end
end
