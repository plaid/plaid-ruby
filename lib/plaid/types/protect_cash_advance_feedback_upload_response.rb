# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/protect/cash_advance/feedback/upload`
    class ProtectCashAdvanceFeedbackUploadResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :upload_id, -> { String }, optional: false, nullable: false
    end
  end
end
