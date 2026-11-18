# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Requests the given version of the Home Lending product. Home Lending accepts no additional configuration today.
    class CraReportCreateHomeLendingProductConfig < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false
    end
  end
end
