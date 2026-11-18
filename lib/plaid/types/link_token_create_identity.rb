# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Identity object used to specify document upload
    class LinkTokenCreateIdentity < Internal::Types::Model
      field :is_document_upload, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :account_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :parsing_configs, -> { Internal::Types::Array[Plaid::Types::IncomeVerificationDocParsingConfig] }, optional: true, nullable: false
    end
  end
end
