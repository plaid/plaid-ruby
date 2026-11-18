# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraCreditProfileInquiryType
      extend Plaid::Internal::Types::Enum

      SOFT_INQUIRY = "SOFT_INQUIRY"
      STANDARD_INQUIRY = "STANDARD_INQUIRY"
    end
  end
end
