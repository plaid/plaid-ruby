# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/questionnaire/create`
    class TransferQuestionnaireCreateResponse < Internal::Types::Model
      field :onboarding_url, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
