# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class Status < Internal::Types::Model
      field :status_code, -> { String }, optional: false, nullable: true, api_name: "StatusCode"

      field :status_description, -> { String }, optional: false, nullable: true, api_name: "StatusDescription"
    end
  end
end
