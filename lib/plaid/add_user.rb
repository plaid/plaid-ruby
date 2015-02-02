module Plaid
  module AddUser
      def add_user(api_level,username,password,type,pin=nil)
        begin
          options = {username:username,password:password,type:type}
          options.merge!(pin:pin) if pin
          res = self.post(api_level,options)
          self.user(res,api_level)
        rescue => e
          error_handler(e)
        end
      end
  end
end