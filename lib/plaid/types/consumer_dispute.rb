# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The information about a previously submitted valid dispute statement by the consumer
    class ConsumerDispute < Internal::Types::Model
      field :consumer_dispute_id, -> { String }, optional: false, nullable: false

      field :dispute_field_create_date, -> { String }, optional: false, nullable: false

      field :category, -> { Plaid::Types::ConsumerDisputeCategory }, optional: false, nullable: false

      field :statement, -> { String }, optional: false, nullable: false
    end
  end
end
