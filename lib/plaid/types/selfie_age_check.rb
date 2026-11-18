# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Age-estimation results from the selfie capture. This field is `null` when an age range could not be estimated from
    # the selfie capture.
    class SelfieAgeCheck < Internal::Types::Model
      field :status, -> { Plaid::Types::SelfieAgeCheckStatus }, optional: false, nullable: false

      field :reported_age, -> { Integer }, optional: false, nullable: true

      field :age_estimate_lower_bound, -> { Integer }, optional: false, nullable: false

      field :age_estimate_upper_bound, -> { Integer }, optional: false, nullable: false
    end
  end
end
