# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module IndividualWatchlistCode
      extend Plaid::Internal::Types::Enum

      AU_CON = "AU_CON"
      CA_CON = "CA_CON"
      EU_CON = "EU_CON"
      IZ_CIA = "IZ_CIA"
      IZ_IPL = "IZ_IPL"
      IZ_PEP = "IZ_PEP"
      IZ_UNC = "IZ_UNC"
      IZ_WBK = "IZ_WBK"
      UK_HMC = "UK_HMC"
      US_DPL = "US_DPL"
      US_DTC = "US_DTC"
      US_FBI = "US_FBI"
      US_FSE = "US_FSE"
      US_ISN = "US_ISN"
      US_MBS = "US_MBS"
      US_PLC = "US_PLC"
      US_SAM = "US_SAM"
      US_SDN = "US_SDN"
      US_SSI = "US_SSI"
      SG_SOF = "SG_SOF"
      TR_TWL = "TR_TWL"
      TR_DFD = "TR_DFD"
      TR_FOR = "TR_FOR"
      TR_WMD = "TR_WMD"
      TR_CMB = "TR_CMB"
    end
  end
end
