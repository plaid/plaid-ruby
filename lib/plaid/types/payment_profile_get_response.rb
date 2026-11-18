# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # PaymentProfileGetResponse defines the response schema for `/payment_profile/get`
    class PaymentProfileGetResponse < Internal::Types::Model
      field :updated_at, -> { String }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :deleted_at, -> { String }, optional: false, nullable: true

      field :status, -> { Plaid::Types::PaymentProfileStatus }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
