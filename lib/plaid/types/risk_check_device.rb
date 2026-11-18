# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Result summary object specifying values for `device` attributes of risk check.
    class RiskCheckDevice < Internal::Types::Model
      field :ip_proxy_type, -> { Plaid::Types::ProxyType }, optional: false, nullable: true

      field :ip_spam_list_count, -> { Integer }, optional: false, nullable: true

      field :ip_timezone_offset, -> { String }, optional: false, nullable: true

      field :risk_level, -> { Plaid::Types::RiskLevel }, optional: true, nullable: false

      field :factors, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
