module Plaid
  module Auth
      def auth(api_level,options)
        begin
          res = self.post(api_level,options)
          self.user(res,api_level)
        rescue => e
          error_handler(e)
        end
      end
  end
end