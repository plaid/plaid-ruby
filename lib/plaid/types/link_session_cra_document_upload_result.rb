# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Deprecated. The details of a document upload CRA session in Link. The CRA document upload flow was never released,
    # so this field is always `null`.
    class LinkSessionCraDocumentUploadResult < Internal::Types::Model
      field :num_bank_statements_uploaded, -> { Integer }, optional: false, nullable: false
    end
  end
end
