# frozen_string_literal: true

module Plaid
  module Credit
    module Types
      class CreditAuditCopyTokenUpdateRequest < Internal::Types::Model
        field :audit_copy_token, -> { String }, optional: false, nullable: false

        field :report_tokens, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      end
    end
  end
end
