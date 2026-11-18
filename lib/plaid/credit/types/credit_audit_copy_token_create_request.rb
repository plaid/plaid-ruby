# frozen_string_literal: true

module Plaid
  module Credit
    module Types
      class CreditAuditCopyTokenCreateRequest < Internal::Types::Model
        field :report_tokens, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      end
    end
  end
end
