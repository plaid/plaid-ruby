# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module AchClass
      extend Plaid::Internal::Types::Enum

      CCD = "ccd"
      PPD = "ppd"
      TEL = "tel"
      WEB = "web"
    end
  end
end
