# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CreditAchClass
      extend Plaid::Internal::Types::Enum

      CCD = "ccd"
      PPD = "ppd"
      WEB = "web"
    end
  end
end
