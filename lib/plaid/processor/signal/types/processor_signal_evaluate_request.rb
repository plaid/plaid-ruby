# frozen_string_literal: true

module Plaid
  module Processor
    module Signal
      module Types
        class ProcessorSignalEvaluateRequest < Internal::Types::Model
          field :processor_token, -> { String }, optional: false, nullable: false

          field :client_transaction_id, -> { String }, optional: false, nullable: false

          field :amount, -> { Float }, optional: false, nullable: false

          field :user_present, -> { Internal::Types::Boolean }, optional: true, nullable: true

          field :client_user_id, -> { String }, optional: true, nullable: false

          field :is_recurring, -> { Internal::Types::Boolean }, optional: true, nullable: true

          field :default_payment_method, -> { String }, optional: true, nullable: true

          field :user, -> { Plaid::Types::SignalUser }, optional: true, nullable: false

          field :device, -> { Plaid::Types::SignalDevice }, optional: true, nullable: false

          field :ruleset_key, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
