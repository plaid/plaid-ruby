require_relative 'test_helper'

# Internal: The test for Plaid::IdentityVerification.

TEMPLATE_ID = "flwtmp_aWogUuKsL6NEHU"
CLIENT_USER_ID = "idv-user-" + Time.now.to_i.to_s
class PlaidIdentityVerificationTest < PlaidTest
  def test_all_routes
    user = Plaid::IdentityVerificationRequestUser.new({
        :client_user_id => CLIENT_USER_ID,
        :email_address => CLIENT_USER_ID + "@example.com",
    })
    identity_verification_create_request = Plaid::IdentityVerificationCreateRequest.new({
        :is_shareable => true,
        :template_id => TEMPLATE_ID,
        :gave_consent => true,
        :user => user,
    })
    response = client.identity_verification_create(identity_verification_create_request)
    assert_kind_of(Plaid::IdentityVerificationCreateResponse, response)
    refute_nil(response.shareable_url)
    assert_equal("active", response.status)

    identity_verification_retry_request = Plaid::IdentityVerificationRetryRequest.new({
        :template_id => TEMPLATE_ID,
        :client_user_id => CLIENT_USER_ID,
        :strategy => Plaid::Strategy::RESET,
    })
    response = client.identity_verification_retry(identity_verification_retry_request)
    assert_kind_of(Plaid::IdentityVerificationRetryResponse, response)
    refute_nil(response.shareable_url)
    assert_equal("active", response.status)
    
    identity_verification_list_request = Plaid::IdentityVerificationListRequest.new({
        :template_id => TEMPLATE_ID,
        :client_user_id => CLIENT_USER_ID,
    })
    response = client.identity_verification_list(identity_verification_list_request)
    assert_kind_of(Plaid::IdentityVerificationListResponse, response)
    refute_nil(response.identity_verifications[0])
    assert_equal(CLIENT_USER_ID, response.identity_verifications[0].client_user_id)

    identity_verification_id = response.identity_verifications[0].id
    identity_verification_get_request = Plaid::IdentityVerificationGetRequest.new({
        :identity_verification_id => identity_verification_id,
    })
    response = client.identity_verification_get(identity_verification_get_request)
    assert_kind_of(Plaid::IdentityVerificationGetResponse, response)
    assert_equal(identity_verification_id, response.id)
  end
end