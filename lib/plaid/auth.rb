module Plaid
  module Auth
      def auth(api_level,username,password,type)
        begin
          options = {username:username,password:password,type:type}
          res = self.post(api_level,options)
          self.user(res,api_level)
        rescue => e
          error_handler(e)
        end
      end
  end
end