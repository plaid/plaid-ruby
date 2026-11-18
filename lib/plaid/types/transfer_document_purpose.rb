# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferDocumentPurpose
      extend Plaid::Internal::Types::Enum

      DUE_DILIGENCE = "DUE_DILIGENCE"
    end
  end
end
