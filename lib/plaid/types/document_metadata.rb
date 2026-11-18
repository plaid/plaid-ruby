# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing metadata from the end user's uploaded document.
    class DocumentMetadata < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :status, -> { String }, optional: true, nullable: true

      field :doc_id, -> { String }, optional: false, nullable: false

      field :doc_type, -> { Plaid::Types::DocType }, optional: false, nullable: false
    end
  end
end
