# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object to be used with the request. If specified, `options` must not be `null`.
    class CashflowReportGetRequestOptions < Internal::Types::Model
      field :account_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
