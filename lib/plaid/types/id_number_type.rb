# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module IDNumberType
      extend Plaid::Internal::Types::Enum

      AR_DNI = "ar_dni"
      AU_DRIVERS_LICENSE = "au_drivers_license"
      AU_PASSPORT = "au_passport"
      BR_CPF = "br_cpf"
      CA_SIN = "ca_sin"
      CL_RUN = "cl_run"
      CN_RESIDENT_CARD = "cn_resident_card"
      CO_NIT = "co_nit"
      DK_CPR = "dk_cpr"
      EG_NATIONAL_ID = "eg_national_id"
      ES_DNI = "es_dni"
      ES_NIE = "es_nie"
      HK_HKID = "hk_hkid"
      IN_PAN = "in_pan"
      IN_EPIC = "in_epic"
      IT_CF = "it_cf"
      JO_CIVIL_ID = "jo_civil_id"
      JP_MY_NUMBER = "jp_my_number"
      KE_HUDUMA_NAMBA = "ke_huduma_namba"
      KW_CIVIL_ID = "kw_civil_id"
      MX_CURP = "mx_curp"
      MX_RFC = "mx_rfc"
      MY_NRIC = "my_nric"
      NG_NIN = "ng_nin"
      NZ_DRIVERS_LICENSE = "nz_drivers_license"
      OM_CIVIL_ID = "om_civil_id"
      PH_PSN = "ph_psn"
      PL_PESEL = "pl_pesel"
      RO_CNP = "ro_cnp"
      SA_NATIONAL_ID = "sa_national_id"
      SE_PIN = "se_pin"
      SG_NRIC = "sg_nric"
      TR_TC_KIMLIK = "tr_tc_kimlik"
      US_SSN = "us_ssn"
      US_SSN_LAST4 = "us_ssn_last_4"
      ZA_SMART_ID = "za_smart_id"
    end
  end
end
