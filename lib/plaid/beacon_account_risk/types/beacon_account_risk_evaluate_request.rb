# frozen_string_literal: true

module Plaid
  module BeaconAccountRisk
    module Types
      class BeaconAccountRiskEvaluateRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: true, nullable: false

        field :options, -> { Plaid::Types::BeaconAccountRiskEvaluateRequestOptions }, optional: true, nullable: false

        field :client_user_id, -> { String }, optional: true, nullable: false

        field :client_evaluation_id, -> { String }, optional: true, nullable: false

        field :evaluation_reason, -> { Plaid::Types::BeaconAccountRiskEvaluateEvaluationReason }, optional: true, nullable: false

        field :device, -> { Plaid::Types::SignalDevice }, optional: true, nullable: false

        field :evaluate_time, -> { String }, optional: true, nullable: false
      end
    end
  end
end
