# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CreditAuditCopyTokenRemoveResponse defines the response schema for `/credit/audit_copy_token/remove`
    class CreditAuditCopyTokenRemoveResponse < Internal::Types::Model
      field :removed, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
