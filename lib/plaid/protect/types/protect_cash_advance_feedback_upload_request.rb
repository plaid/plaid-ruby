# frozen_string_literal: true

module Plaid
  module Protect
    module Types
      class ProtectCashAdvanceFeedbackUploadRequest < Internal::Types::Model
        field :feedback_type, -> { Plaid::Types::CashAdvanceFeedbackType }, optional: false, nullable: false

        field :file, -> { String }, optional: false, nullable: false
      end
    end
  end
end
