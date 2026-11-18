# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A single entry in an authorization's adaptive guarantee settlement schedule, describing one tranche of guaranteed
    # funds.
    class AuthorizationGuaranteeScheduleItem < Internal::Types::Model
      field :amount, -> { String }, optional: false, nullable: false

      field :observation_window_business_days, -> { Integer }, optional: false, nullable: false
    end
  end
end
