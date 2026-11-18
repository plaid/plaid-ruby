# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Status of the income verification webhook
    class IncomeVerificationWebhookStatus < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
