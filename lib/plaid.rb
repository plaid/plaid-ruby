require 'faraday'
require 'faraday_middleware'

require_relative 'plaid/middleware'
require_relative 'plaid/products/base_product'
require_relative 'plaid/errors'
require_relative 'plaid/version'
require_relative 'plaid/models'
require_relative 'plaid/products/accounts'
require_relative 'plaid/products/auth'
require_relative 'plaid/products/categories'
require_relative 'plaid/products/credit_details'
require_relative 'plaid/products/identity'
require_relative 'plaid/products/income'
require_relative 'plaid/products/institutions'
require_relative 'plaid/products/item'
require_relative 'plaid/products/processor'
require_relative 'plaid/products/sandbox'
require_relative 'plaid/products/transactions'
require_relative 'plaid/client'

module Plaid
  # Public: Get relaxed models state.
  #
  # We support two modes for parsing response bodies.
  #
  # Strict mode (default). Unknown attributes will cause NoMethodError.
  #
  # Relaxed mode. If a response contains an unknown
  # attribute, it won't cause any error and will be accessible
  # using brackets notation: `response['unknown_attribute']`.
  #
  # Returns truey value for relaxed mode and falsey for strict.
  def relaxed_models?
    defined?(@relaxed_models) && @relaxed_models
  end

  def relaxed_models=(value)
    @relaxed_models = value
  end

  module_function :relaxed_models?, :relaxed_models=
end
