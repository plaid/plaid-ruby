# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data, images, analysis, and results from the `documentary_verification` step. This field will be `null` unless
    # `steps.documentary_verification` has reached a terminal state of `success`, `failed`, `manually_approved`, or
    # `manually_rejected`. It is also returned while the user is being asked to retry after a failed document attempt.
    class DocumentaryVerification < Internal::Types::Model
      field :status, -> { String }, optional: false, nullable: false

      field :documents, -> { Internal::Types::Array[Plaid::Types::DocumentaryVerificationDocument] }, optional: false, nullable: false
    end
  end
end
