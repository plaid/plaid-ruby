# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional set of parameters corresponding to statements options.
    class SandboxPublicTokenCreateRequestOptionsStatements < Internal::Types::Model
      field :start_date, -> { String }, optional: false, nullable: false

      field :end_date, -> { String }, optional: false, nullable: false
    end
  end
end
