# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The response schema for `/beacon/user/account_insights/get`
    class BeaconUserAccountInsightsGetResponse < Internal::Types::Model
      field :beacon_user_id, -> { String }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :updated_at, -> { String }, optional: false, nullable: false

      field :bank_account_insights, -> { Plaid::Types::BeaconBankAccounts }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
