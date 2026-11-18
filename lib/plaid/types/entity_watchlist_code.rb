# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module EntityWatchlistCode
      extend Plaid::Internal::Types::Enum

      CA_CON = "CA_CON"
      EU_CON = "EU_CON"
      IZ_SOE = "IZ_SOE"
      IZ_UNC = "IZ_UNC"
      IZ_WBK = "IZ_WBK"
      US_CAP = "US_CAP"
      US_FSE = "US_FSE"
      US_MBS = "US_MBS"
      US_SDN = "US_SDN"
      US_SSI = "US_SSI"
      US_CMC = "US_CMC"
      US_UVL = "US_UVL"
      US_SAM = "US_SAM"
      US_TEL = "US_TEL"
      AU_CON = "AU_CON"
      UK_HMC = "UK_HMC"
    end
  end
end
