# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The Base Report product at a given version. Base Report accepts no additional configuration today.
    class CraBaseReportProductConfig < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false
    end
  end
end
