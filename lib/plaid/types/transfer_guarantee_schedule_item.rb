# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A single entry in the adaptive guarantee settlement schedule, describing one tranche of guaranteed funds. Adds
    # `observation_window_expiration_time`, which is only known once a transfer is created.
    class TransferGuaranteeScheduleItem < Internal::Types::Model
      field :amount, -> { String }, optional: false, nullable: false

      field :observation_window_business_days, -> { Integer }, optional: false, nullable: false

      field :observation_window_expiration_time, -> { String }, optional: true, nullable: true
    end
  end
end
