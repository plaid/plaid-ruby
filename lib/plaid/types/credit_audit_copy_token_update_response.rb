# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/credit/audit_copy_token/update`
    class CreditAuditCopyTokenUpdateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :updated, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
