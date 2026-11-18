# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module LinkSessionSuccessMetadataTransferStatus
      extend Plaid::Internal::Types::Enum

      COMPLETE = "COMPLETE"
      INCOMPLETE = "INCOMPLETE"
    end
  end
end
