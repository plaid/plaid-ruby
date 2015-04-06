module Plaid
  module AddUser
      def add_user(api_level,username,password,type,pin=nil,options=nil)
        begin
          payload = {username:username,password:password,type:type}
          payload.merge!(pin:pin) if pin
          payload.merge!(options: options) if options
          res = self.post(api_level,payload)
          self.user(res,api_level)
        rescue => e
          error_handler(e)
        end
      end

    def set_user(token,api_level=[])
      begin
        self.existing_user(token,api_level)
      rescue => e
        error_handler(e)
      end
    end
  end
end