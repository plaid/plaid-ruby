# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class Role < Internal::Types::Model
      field :role_detail, -> { Plaid::Types::RoleDetail }, optional: false, nullable: false, api_name: "ROLE_DETAIL"
    end
  end
end
