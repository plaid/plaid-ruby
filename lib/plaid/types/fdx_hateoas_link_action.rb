# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module FdxHateoasLinkAction
      extend Plaid::Internal::Types::Enum

      GET = "GET"
      POST = "POST"
      PATCH = "PATCH"
      DELETE = "DELETE"
      PUT = "PUT"
    end
  end
end
