# frozen_string_literal: true

require "test_helper"

describe Plaid::Errors::ResponseError do
  it "defaults to empty headers for existing callers" do
    error = Plaid::Errors::ResponseError.new("unavailable", code: 503)

    assert_empty error.headers
  end

  it "preserves response headers on status-specific errors" do
    headers = { "retry-after" => ["30"], "x-request-id" => ["req_123"], "set-cookie" => ["a=1", "b=2"] }
    body = { "message" => "unavailable" }
    error_class = Plaid::Errors::ResponseError.subclass_for_code(503)
    error = error_class.new("unavailable", code: 503, body: body, headers: headers)

    assert_equal headers, error.headers
    assert_equal 503, error.code
    assert_equal body, error.body
    assert_equal "unavailable", error.message
  end

  it "looks up headers regardless of capitalization" do
    headers = { "Retry-After" => ["7"], "x-request-id" => ["hdr-req-1"], "set-cookie" => ["a=1", "b=2"] }
    error = Plaid::Errors::ResponseError.subclass_for_code(429).new("rate limited", code: 429, headers: headers)

    assert_equal ["7"], error.headers["Retry-After"]
    assert_equal ["7"], error.headers["retry-after"]
    assert_equal ["7"], error.headers["RETRY-AFTER"]
    assert_equal ["hdr-req-1"], error.headers["X-Request-Id"]
    assert_equal ["hdr-req-1"], error.headers.fetch("X-Request-ID")
    assert_equal [["7"], ["hdr-req-1"]], error.headers.values_at("Retry-After", "X-Request-Id")
    assert error.headers.key?("Set-Cookie")
    assert_includes error.headers, "SET-COOKIE"
    assert_equal({ "retry-after" => ["7"], "x-request-id" => ["hdr-req-1"], "set-cookie" => ["a=1", "b=2"] }, error.headers)
    assert_nil error.headers["X-Missing"]
  end

  it "returns the first value of a header" do
    headers = { "retry-after" => ["7"], "set-cookie" => ["a=1", "b=2"] }
    error = Plaid::Errors::ResponseError.new("rate limited", code: 429, headers: headers)

    assert_equal "7", error.header("Retry-After")
    assert_equal "a=1", error.header("Set-Cookie")
    assert_nil error.header("X-Missing")
  end
end
