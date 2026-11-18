# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An identity verification attempt represents a customer's attempt to verify their identity, reflecting the required
    # steps for completing the session, the results for each step, and information collected in the process.
    class IdentityVerificationGetResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :client_user_id, -> { String }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :completed_at, -> { String }, optional: false, nullable: true

      field :previous_attempt_id, -> { String }, optional: false, nullable: true

      field :shareable_url, -> { String }, optional: false, nullable: true

      field :template, -> { Plaid::Types::IdentityVerificationTemplateReference }, optional: false, nullable: false

      field :user, -> { Plaid::Types::IdentityVerificationUserData }, optional: false, nullable: false

      field :status, -> { Plaid::Types::IdentityVerificationStatus }, optional: false, nullable: false

      field :steps, -> { Plaid::Types::IdentityVerificationStepSummary }, optional: false, nullable: false

      field :documentary_verification, -> { Plaid::Types::DocumentaryVerification }, optional: false, nullable: true

      field :selfie_check, -> { Plaid::Types::SelfieCheck }, optional: false, nullable: true

      field :kyc_check, -> { Plaid::Types::KycCheckDetails }, optional: false, nullable: true

      field :risk_check, -> { Plaid::Types::RiskCheckDetails }, optional: false, nullable: true

      field :verify_sms, -> { Plaid::Types::VerifySmsDetails }, optional: false, nullable: true

      field :watchlist_screening_id, -> { String }, optional: false, nullable: true

      field :beacon_user_id, -> { String }, optional: false, nullable: true

      field :user_id, -> { String }, optional: false, nullable: true

      field :redacted_at, -> { String }, optional: false, nullable: true

      field :latest_scored_protect_event, -> { Plaid::Types::IdvProtectEvent }, optional: true, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
