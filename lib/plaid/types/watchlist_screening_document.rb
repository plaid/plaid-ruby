# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An official document, usually issued by a governing body or institution, with an associated identifier.
    class WatchlistScreeningDocument < Internal::Types::Model
      field :type, -> { Plaid::Types::WatchlistScreeningDocumentType }, optional: false, nullable: false

      field :number, -> { String }, optional: false, nullable: false
    end
  end
end
