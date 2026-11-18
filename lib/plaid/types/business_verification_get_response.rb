# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A business verification represents a check of a business's identity and risk profile, including information
    # collected about the business and results from third-party data providers.
    class BusinessVerificationGetResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :client_user_id, -> { String }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :completed_at, -> { String }, optional: false, nullable: true

      field :redacted_at, -> { String }, optional: false, nullable: true

      field :status, -> { Plaid::Types::BusinessVerificationStatusOverall }, optional: false, nullable: false

      field :requested_checks, -> { Plaid::Types::BusinessVerificationRequestedChecks }, optional: false, nullable: false

      field :search_terms, -> { Plaid::Types::BusinessSearchTerms }, optional: false, nullable: false

      field :business_verification, -> { Plaid::Types::BusinessVerificationCheck }, optional: false, nullable: true

      field :risk_check, -> { Plaid::Types::BusinessRiskCheck }, optional: false, nullable: true

      field :digital_presence_check, -> { Plaid::Types::BusinessDigitalPresenceCheck }, optional: false, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false

      field :shareable_url, -> { String }, optional: false, nullable: true
    end
  end
end
