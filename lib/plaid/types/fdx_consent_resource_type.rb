# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module FdxConsentResourceType
      extend Plaid::Internal::Types::Enum

      ACCOUNT = "ACCOUNT"
      CUSTOMER = "CUSTOMER"
      DOCUMENT = "DOCUMENT"
    end
  end
end
