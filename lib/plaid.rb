require 'plaid/version'
require 'plaid/config'
require 'plaid/util'

require 'plaid/auth'
require 'plaid/user/user'
require 'plaid/institution/institution'
require 'plaid/category/category'

module Plaid
  # Define an instance of the gem thus responding with one customer at a time
  class << self
    # Include the SDK methods

    # Configures the gem with the public, private, and environment vars
    include Plaid::Configure

    # Include the utility classes used throughout the gem
    include Plaid::Util

    # Includes the method to authenticate the user. Defined in auth.rb
    include Plaid::Auth

    # Builds the user object and returns on successful authentication
    def user(res)
      @user = Plaid::User.new
      @user.new(res)
    end

    # Builds an institution object and returns when the institution details exist
    def institution(res)
      @institution = Plaid::Institution.new
      @institution.new(res)
    end

    # Builds an institution object and returns when the category details exist
    def category(res)
      @category = Plaid::Category.new
      @category.new(res)
    end

  end
end