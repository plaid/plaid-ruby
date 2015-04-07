require 'json'

module Plaid
  module AddUser
    # Required parameters:
    #   api_level, username, password, type
    def add_user(api_level, username, password, type, pin = nil, options = nil)
      payload = { username: username, password: password, type: type }

      payload[:pin]     = pin if pin
      payload[:options] = options.is_a?(Hash) ? JSON.generate(options) : options if options

      res = self.post(api_level, payload)
      self.user(res, api_level)
    rescue => e
      error_handler e
    end

    def set_user(token, api_level=[], type=nil)
      token = token + '_' + type unless type.nil?
      self.existing_user(token,api_level)
    rescue => e
      error_handler e
    end
  end
end
