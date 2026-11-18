# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CreditAuditCopyTokenCreateResponse defines the response schema for `/credit/audit_copy_token/create`
    class CreditAuditCopyTokenCreateResponse < Internal::Types::Model
      field :audit_copy_token, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
