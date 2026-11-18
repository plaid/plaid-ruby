# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraCheckReportFreddieMacGetRequest defines the request schema for `/cra/check_report/freddie_mac/get`
    class CraCheckReportFreddieMacGetRequest < Internal::Types::Model
      field :third_party_user_token, -> { String }, optional: false, nullable: false

      field :client_id, -> { String }, optional: true, nullable: false

      field :secret, -> { String }, optional: true, nullable: false
    end
  end
end
