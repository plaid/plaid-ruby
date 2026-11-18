# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ReasonCode
      extend Plaid::Internal::Types::Enum

      AC03 = "AC03"
      AM09 = "AM09"
      CUST = "CUST"
      DUPL = "DUPL"
      FRAD = "FRAD"
      TECH = "TECH"
      UPAY = "UPAY"
      AC14 = "AC14"
      AM06 = "AM06"
      BE05 = "BE05"
      FOCR = "FOCR"
      MS02 = "MS02"
      MS03 = "MS03"
      RR04 = "RR04"
      RUTA = "RUTA"
    end
  end
end
