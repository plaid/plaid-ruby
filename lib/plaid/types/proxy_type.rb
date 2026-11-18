# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ProxyType
      extend Plaid::Internal::Types::Enum

      NONE_DETECTED = "none_detected"
      TOR = "tor"
      VPN = "vpn"
      WEB_PROXY = "web_proxy"
      PUBLIC_PROXY = "public_proxy"
    end
  end
end
