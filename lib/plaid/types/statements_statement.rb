# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A statement's metadata associated with an account
    class StatementsStatement < Internal::Types::Model
      field :statement_id, -> { String }, optional: false, nullable: false

      field :date_posted, -> { String }, optional: true, nullable: true

      field :month, -> { Integer }, optional: false, nullable: false

      field :year, -> { Integer }, optional: false, nullable: false
    end
  end
end
