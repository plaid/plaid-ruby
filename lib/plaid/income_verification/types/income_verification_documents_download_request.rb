# frozen_string_literal: true

module Plaid
  module IncomeVerification
    module Types
      class IncomeVerificationDocumentsDownloadRequest < Internal::Types::Model
        field :income_verification_id, -> { String }, optional: true, nullable: true

        field :access_token, -> { String }, optional: true, nullable: true

        field :document_id, -> { String }, optional: true, nullable: true
      end
    end
  end
end
