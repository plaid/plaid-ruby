# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module Form1099Type
      extend Plaid::Internal::Types::Enum

      FORM1099TYPE_UNKNOWN = "FORM_1099_TYPE_UNKNOWN"
      FORM1099TYPE_MISC = "FORM_1099_TYPE_MISC"
      FORM1099TYPE_K = "FORM_1099_TYPE_K"
    end
  end
end
