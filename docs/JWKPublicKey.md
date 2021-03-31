# Plaid::JWKPublicKey

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **alg** | **String** | The alg member identifies the cryptographic algorithm family used with the key. | [optional] |
| **crv** | **String** | The crv member identifies the cryptographic curve used with the key. | [optional] |
| **kid** | **String** | The kid (Key ID) member can be used to match a specific key. This can be used, for instance, to choose among a set of keys within the JWK during key rollover. | [optional] |
| **kty** | **String** | The kty (key type) parameter identifies the cryptographic algorithm family used with the key, such as RSA or EC. | [optional] |
| **use** | **String** | The use (public key use) parameter identifies the intended use of the public key. | [optional] |
| **x** | **String** | The x member contains the x coordinate for the elliptic curve point. | [optional] |
| **y** | **String** | The y member contains the y coordinate for the elliptic curve point. | [optional] |
| **created_at** | **Integer** |  | [optional] |
| **expired_at** | **Integer** |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::JWKPublicKey.new(
  alg: null,
  crv: null,
  kid: null,
  kty: null,
  use: null,
  x: null,
  y: null,
  created_at: null,
  expired_at: null
)
```

