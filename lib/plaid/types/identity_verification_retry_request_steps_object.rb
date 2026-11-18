# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Instructions for the `custom` retry strategy specifying which steps should be required or skipped.
    #
    #
    # Note:
    #
    #
    # This field must be provided when the retry strategy is `custom` and must be omitted otherwise.
    #
    # Custom retries override settings in your Plaid Template. For example, if your Plaid Template has `verify_sms`
    # disabled, a custom retry with `verify_sms` enabled will still require the step.
    #
    # The `selfie_check` step is currently not supported on the sandbox server. Sandbox requests will silently disable
    # the `selfie_check` step when provided.
    class IdentityVerificationRetryRequestStepsObject < Internal::Types::Model
      field :verify_sms, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :kyc_check, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :documentary_verification, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :selfie_check, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
