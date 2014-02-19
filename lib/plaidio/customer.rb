module Plaidio
  
  BASE_URL = 'https://tartan.plaid.com/'
  
  def add_account()
    # Add an account to the customer, and return the json response
  end
  
  def mfa_step()
    # If the bank requires MFA, take the options and try to connect
  end
  
  def get_transactions(access_token)
    # Get transactions, and return as json
  end
  
  def delete_account(access_token)
    # Delete the account, and return a success item
  end
  
  protected 
  
    def parse_response(response)
      # After the method has returned some response, parse and return to the method
    end
    
  private
  
    def get(path,options={})
      # All the get requests go here, and return to the original method
    end
    
    def post(path,options={})
      # All the post requests go here, and return to the original method
    end
    
    def delete(path,options={})
      # All the delete requests go here, and return to the original method
    end
    
    def send(options={})
      # We'll send all the requests out of here, so as not to repeat ourselves
    end
  
end