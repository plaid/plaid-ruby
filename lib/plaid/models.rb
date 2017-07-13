require 'hashie'

module Plaid
  module Models
    class BaseModel < Hashie::Dash
      include Hashie::Extensions::Dash::IndifferentAccess
      include Hashie::Extensions::Dash::Coercion
    end

    class BaseResponse < BaseModel
      # Public: The String request ID assigned by the API.
      property :request_id
    end

    class Error < BaseModel
      # Public: The String broad categorization of the error. One of:
      # 'INVALID_REQUEST', 'INVALID_INPUT', 'RATE_LIMIT_EXCEEDED', 'API_ERROR',
      # or 'ITEM_ERROR'.
      property :error_type

      # Public: The particular String error code. Each error_type has a
      # specific set of error_codes.
      property :error_code

      # Public: A developer-friendly representation of the error message.
      property :error_message

      # Public: A user-friendly representation of the error message. nil if the
      # error is not related to user action.
      property :display_message
    end

    class Item < BaseModel
      # Public: The Array with String products available for this item
      # (e.g. ["balance", "auth"]).
      property :available_products

      # Public: The Array with String products billed for this item
      # (e.g. ["identity", "transactions"]).
      property :billed_products

      # Public: The String error related to
      property :error, coerce: Error

      # Public: The String institution ID for this item.
      property :institution_id

      # Public: The String item ID.
      property :item_id

      # Public: The String webhook URL.
      property :webhook
    end

    class Balances < BaseModel
      # Public: The Number available balance (or nil).
      property :available

      # Public: The Number current balance (or nil).
      property :current

      # Public: The Number limit (or nil).
      property :limit
    end

    class Account < BaseModel
      # Public: The String account ID, e.g. "QKKzevvp33HxPWpoqn6rI13BxW4awNSjnw4xv".
      property :account_id

      # Public: Balances for this account.
      property :balances, coerce: Balances

      # Public: The String mask, e.g. "0000".
      property :mask

      # Public: The String account name, e.g. "Plaid Checking".
      property :name

      # Public: The String official account name, e.g. "Plaid Gold Checking".
      property :official_name

      # Public: The String type, e.g. "depository".
      property :type

      # Public: The String subtype, e.g. "checking".
      property :subtype
    end

    class Number < BaseModel
      # Public: The String account number. E.g. "1111222233330000".
      property :account

      # Public: The String account ID. E.g. "vzeNDwK7KQIm4yEog683uElbp9GRLEFXGK98D".
      property :account_id

      # Public: The String routing number. E.g. "011401533".
      property :routing

      # Public: The String wire routing number. E.g. "021000021".
      property :wire_routing
    end

    class Category < BaseModel
      # Public: The String category ID. E.g. "10000000".
      property :category_id

      # Public: The Array of Strings category hierarchy.
      # E.g. ["Recreation", "Arts & Entertainment", "Circuses and Carnivals"].
      property :hierarchy

      # Public: The String category group. E.g. "place".
      property :group
    end
  end
end
