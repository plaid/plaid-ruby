# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data about an official document used to report the user's income to the IRS.
    class Taxform < Internal::Types::Model
      field :doc_id, -> { String }, optional: true, nullable: false

      field :document_type, -> { String }, optional: false, nullable: false

      field :w2, -> { Plaid::Types::W2 }, optional: true, nullable: false
    end
  end
end
