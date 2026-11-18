# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module IdentityVerificationLanguage
      extend Plaid::Internal::Types::Enum

      EN_US = "en-US"
      ES_ES = "es-ES"
      ES_US = "es-US"
      FR_CA = "fr-CA"
      JA_JP = "ja-JP"
      PT_BR = "pt-BR"
      PT_PT = "pt-PT"
    end
  end
end
