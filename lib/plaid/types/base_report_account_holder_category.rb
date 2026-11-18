# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BaseReportAccountHolderCategory
      extend Plaid::Internal::Types::Enum

      BUSINESS = "business"
      PERSONAL = "personal"
      UNRECOGNIZED = "unrecognized"
    end
  end
end
