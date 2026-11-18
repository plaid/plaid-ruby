# frozen_string_literal: true

module Plaid
  module BeaconUser
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Create and scan a Beacon User against your Beacon Program, according to your program's settings.
      #
      # When you submit a new user to `/beacon/user/create`, several checks are performed immediately:
      #
      # - The user's PII (provided within the `user` object) is searched against all other users within the Beacon
      # Program you specified. If a match is found that violates your program's "Duplicate Information Filtering"
      # settings, the user will be returned with a status of `pending_review`.
      #
      # - The user's PII is also searched against all fraud reports created by your organization across all of your
      # Beacon Programs. If the user's data matches a fraud report that your team created, the user will be returned
      # with a status of `rejected`.
      #
      # - Finally, the user's PII is searched against all fraud reports shared with the Beacon Network by other
      # companies. If a matching fraud report is found, the user will be returned with a `pending_review` status if your
      # program has enabled automatic flagging based on network fraud.
      #
      # @param request_options [Hash]
      # @param params [Plaid::BeaconUser::Types::BeaconUserCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.beacon_user.create(
      #     program_id: "becprg_11111111111111",
      #     client_user_id: "your-db-id-3b24110",
      #     user: {
      #       name: {
      #         given_name: "Leslie",
      #         family_name: "Knope"
      #       }
      #     }
      #   )
      #
      # @return [Plaid::Types::BeaconUserCreateResponse]
      def create(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "beacon/user/create",
          body: Plaid::BeaconUser::Types::BeaconUserCreateRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Plaid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          begin
            (response.body.to_s.empty? ? nil : Plaid::Types::BeaconUserCreateResponse.load(response.body))
          rescue ::JSON::ParserError
            raise Plaid::Errors::ResponseError.new(response.body, code: code, headers: response.to_hash)
          end
        else
          error_class = Plaid::Errors::ResponseError.subclass_for_code(code)
          error_types = {
            400 => Plaid::Types::PlaidError,
            401 => Plaid::Types::PlaidError,
            429 => Plaid::Types::PlaidError,
            500 => Plaid::Types::PlaidError,
            (400..499) => Plaid::Types::PlaidError,
            (500..599) => Plaid::Types::PlaidError
          }
          error_body = Plaid::Errors::ResponseError.load_error_body(code, response.body, error_types)
          raise error_class.new(response.body, code: code, body: error_body, headers: response.to_hash)
        end
      end

      # Fetch a Beacon User.
      #
      # The Beacon User is returned with all of their associated information and a `status` based on the Beacon Network
      # duplicate record and fraud checks.
      #
      # @param request_options [Hash]
      # @param params [Plaid::BeaconUser::Types::BeaconUserGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.beacon_user.get(beacon_user_id: "becusr_42cF1MNo42r9Xj")
      #
      # @return [Plaid::Types::BeaconUserGetResponse]
      def get(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "beacon/user/get",
          body: Plaid::BeaconUser::Types::BeaconUserGetRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Plaid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          begin
            (response.body.to_s.empty? ? nil : Plaid::Types::BeaconUserGetResponse.load(response.body))
          rescue ::JSON::ParserError
            raise Plaid::Errors::ResponseError.new(response.body, code: code, headers: response.to_hash)
          end
        else
          error_class = Plaid::Errors::ResponseError.subclass_for_code(code)
          error_types = {
            400 => Plaid::Types::PlaidError,
            401 => Plaid::Types::PlaidError,
            429 => Plaid::Types::PlaidError,
            500 => Plaid::Types::PlaidError,
            (400..499) => Plaid::Types::PlaidError,
            (500..599) => Plaid::Types::PlaidError
          }
          error_body = Plaid::Errors::ResponseError.load_error_body(code, response.body, error_types)
          raise error_class.new(response.body, code: code, body: error_body, headers: response.to_hash)
        end
      end

      # Update the status of a Beacon User.
      #
      # When updating a Beacon User's status via this endpoint, Plaid validates that the status change is consistent
      # with the related state for this Beacon User. Specifically, we will check:
      #
      # 1. Whether there are any associated Beacon Reports connected to the Beacon User, and
      # 2. Whether there are any confirmed Beacon Report Syndications connected to the Beacon User.
      #
      # When updating a Beacon User's status to `rejected`, we enforce that either a Beacon Report has been created for
      # the Beacon User or a Beacon Report Syndication has been confirmed.
      # When updating a Beacon User's status to `cleared`, we enforce that there are no active Beacon Reports or
      # confirmed Beacon Report Syndications associated with the user. If you previously created a Beacon Report for
      # this user, you must delete it before updating the Beacon User's status to `cleared`.
      # There are no restrictions on updating a Beacon User's status to `pending_review`.
      #
      # If these conditions are not met, the request will be rejected with an error explaining the issue.
      #
      # @param request_options [Hash]
      # @param params [Plaid::BeaconUser::Types::BeaconUserReviewRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.beacon_user.review(
      #     beacon_user_id: "becusr_42cF1MNo42r9Xj",
      #     status: "rejected"
      #   )
      #
      # @return [Plaid::Types::BeaconUserGetResponse]
      def review(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "beacon/user/review",
          body: Plaid::BeaconUser::Types::BeaconUserReviewRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Plaid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          begin
            (response.body.to_s.empty? ? nil : Plaid::Types::BeaconUserGetResponse.load(response.body))
          rescue ::JSON::ParserError
            raise Plaid::Errors::ResponseError.new(response.body, code: code, headers: response.to_hash)
          end
        else
          error_class = Plaid::Errors::ResponseError.subclass_for_code(code)
          error_types = {
            400 => Plaid::Types::PlaidError,
            401 => Plaid::Types::PlaidError,
            429 => Plaid::Types::PlaidError,
            500 => Plaid::Types::PlaidError,
            (400..499) => Plaid::Types::PlaidError,
            (500..599) => Plaid::Types::PlaidError
          }
          error_body = Plaid::Errors::ResponseError.load_error_body(code, response.body, error_types)
          raise error_class.new(response.body, code: code, body: error_body, headers: response.to_hash)
        end
      end

      # Update the identity data for a Beacon User in your Beacon Program or add new accounts to the Beacon User.
      #
      # Similar to `/beacon/user/create`, several checks are performed immediately when you submit an identity data
      # change to `/beacon/user/update`:
      #
      # - The user's updated PII is searched against all other users within the Beacon Program you specified. If a match
      # is found that violates your program's "Duplicate Information Filtering" settings, the user will be returned with
      # a status of `pending_review`.
      #
      # - The user's updated PII is also searched against all fraud reports created by your organization across all of
      # your Beacon Programs. If the user's data matches a fraud report that your team created, the user will be
      # returned with a status of `rejected`.
      #
      # - Finally, the user's PII is searched against all fraud reports shared with the Beacon Network by other
      # companies. If a matching fraud report is found, the user will be returned with a `pending_review` status if your
      # program has enabled automatic flagging based on network fraud.
      #
      # Plaid maintains a version history for each Beacon User, so the Beacon User's identity data before and after the
      # update is retained as separate versions.
      #
      # @param request_options [Hash]
      # @param params [Plaid::BeaconUser::Types::BeaconUserUpdateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.beacon_user.update(beacon_user_id: "becusr_42cF1MNo42r9Xj")
      #
      # @return [Plaid::Types::BeaconUserUpdateResponse]
      def update(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "beacon/user/update",
          body: Plaid::BeaconUser::Types::BeaconUserUpdateRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Plaid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          begin
            (response.body.to_s.empty? ? nil : Plaid::Types::BeaconUserUpdateResponse.load(response.body))
          rescue ::JSON::ParserError
            raise Plaid::Errors::ResponseError.new(response.body, code: code, headers: response.to_hash)
          end
        else
          error_class = Plaid::Errors::ResponseError.subclass_for_code(code)
          error_types = {
            400 => Plaid::Types::PlaidError,
            401 => Plaid::Types::PlaidError,
            429 => Plaid::Types::PlaidError,
            500 => Plaid::Types::PlaidError,
            (400..499) => Plaid::Types::PlaidError,
            (500..599) => Plaid::Types::PlaidError
          }
          error_body = Plaid::Errors::ResponseError.load_error_body(code, response.body, error_types)
          raise error_class.new(response.body, code: code, body: error_body, headers: response.to_hash)
        end
      end

      # List all changes to the Beacon User in reverse-chronological order.
      #
      # Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::BeaconUser` in the
      # `beacon_users` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as
      # a `Plaid::Types::BeaconUserHistoryListResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Plaid::BeaconUser::Types::BeaconUserHistoryListRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.beacon_user.list_history(beacon_user_id: "becusr_42cF1MNo42r9Xj")
      #
      # @return [Plaid::Internal::CursorItemIterator]
      def list_history(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        Plaid::Internal::CursorItemIterator.new(
          cursor_field: :next_cursor,
          item_field: :beacon_users,
          initial_cursor: params[:cursor]
        ) do |next_cursor|
          params[:cursor] = next_cursor
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "beacon/user/history/list",
            body: Plaid::BeaconUser::Types::BeaconUserHistoryListRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Plaid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            begin
              parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::BeaconUserHistoryListResponse.load(response.body))
            rescue ::JSON::ParserError
              raise Plaid::Errors::ResponseError.new(response.body, code: code, headers: response.to_hash)
            end
            [parsed_response, response]
          else
            error_class = Plaid::Errors::ResponseError.subclass_for_code(code)
            error_types = {
              400 => Plaid::Types::PlaidError,
              401 => Plaid::Types::PlaidError,
              429 => Plaid::Types::PlaidError,
              500 => Plaid::Types::PlaidError,
              (400..499) => Plaid::Types::PlaidError,
              (500..599) => Plaid::Types::PlaidError
            }
            error_body = Plaid::Errors::ResponseError.load_error_body(code, response.body, error_types)
            raise error_class.new(response.body, code: code, body: error_body, headers: response.to_hash)
          end
        end
      end

      # Get Account Insights for all Accounts linked to this Beacon User. The insights for each account are computed
      # based on the information that was last retrieved from the financial institution.
      #
      # @param request_options [Hash]
      # @param params [Plaid::BeaconUser::Types::BeaconUserAccountInsightsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.beacon_user.get_account_insights(
      #     beacon_user_id: "becusr_42cF1MNo42r9Xj",
      #     access_token: "access_token"
      #   )
      #
      # @return [Plaid::Types::BeaconUserAccountInsightsGetResponse]
      def get_account_insights(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "beacon/user/account_insights/get",
          body: Plaid::BeaconUser::Types::BeaconUserAccountInsightsGetRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Plaid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          begin
            (response.body.to_s.empty? ? nil : Plaid::Types::BeaconUserAccountInsightsGetResponse.load(response.body))
          rescue ::JSON::ParserError
            raise Plaid::Errors::ResponseError.new(response.body, code: code, headers: response.to_hash)
          end
        else
          error_class = Plaid::Errors::ResponseError.subclass_for_code(code)
          error_types = {
            400 => Plaid::Types::PlaidError,
            401 => Plaid::Types::PlaidError,
            429 => Plaid::Types::PlaidError,
            500 => Plaid::Types::PlaidError,
            (400..499) => Plaid::Types::PlaidError,
            (500..599) => Plaid::Types::PlaidError
          }
          error_body = Plaid::Errors::ResponseError.load_error_body(code, response.body, error_types)
          raise error_class.new(response.body, code: code, body: error_body, headers: response.to_hash)
        end
      end
    end
  end
end
