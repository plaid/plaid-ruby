# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object which contains additional metadata about the institution used to compute the verification attribute
    class DocumentRiskSignalInstitutionMetadata < Internal::Types::Model
      field :item_id, -> { String }, optional: false, nullable: false
    end
  end
end
