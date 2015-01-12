module Plaid
  module Auth
      def auth(api_level,username,password,type)
        begin
          res = self.post(api_level,username,password,type)
          self.user(res)
        rescue => e
          error_handler(e)
        end
      end
  end
end