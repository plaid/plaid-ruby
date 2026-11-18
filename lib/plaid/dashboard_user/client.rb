# frozen_string_literal: true

module Plaid
  module DashboardUser
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # The `/dashboard_user/get` endpoint provides details (such as email address) about a specific Dashboard user
      # based on the `dashboard_user_id` field, which is returned in the `audit_trail` object of certain Monitor and
      # Beacon endpoints. This can be used to identify the specific reviewer who performed a Dashboard action.
      #
      # @param request_options [Hash]
      # @param params [Plaid::DashboardUser::Types::DashboardUserGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.dashboard_user.get(dashboard_user_id: "54350110fedcbaf01234ffee")
      #
      # @return [Plaid::Types::DashboardUserGetResponse]
      def get(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "dashboard_user/get",
          body: Plaid::DashboardUser::Types::DashboardUserGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::DashboardUserGetResponse.load(response.body))
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

      # The `/dashboard_user/list` endpoint provides details (such as email address) about all Dashboard users
      # associated with your account. This can be used to audit or track the list of reviewers for Monitor, Beacon, and
      # Identity Verification products.
      #
      # Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::DashboardUser` in the
      # `dashboard_users` field of every page, requesting pages as they are needed. Call `pages` on it to get each page
      # as a `Plaid::Types::DashboardUserListResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Plaid::DashboardUser::Types::DashboardUserListRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.dashboard_user.list
      #
      # @return [Plaid::Internal::CursorItemIterator]
      def list(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        Plaid::Internal::CursorItemIterator.new(
          cursor_field: :next_cursor,
          item_field: :dashboard_users,
          initial_cursor: params[:cursor]
        ) do |next_cursor|
          params[:cursor] = next_cursor
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "dashboard_user/list",
            body: Plaid::DashboardUser::Types::DashboardUserListRequest.new(params).to_h,
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
              parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::DashboardUserListResponse.load(response.body))
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
    end
  end
end
