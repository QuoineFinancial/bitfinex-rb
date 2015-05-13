require 'rest_client'
require 'base64'
require 'json'
require 'digest/hmac'
require 'digest/sha2'

module Bitfinex
  module Net
    def self.to_uri(path)
      return "https://api.bitfinex.com#{path}"
    end

    def self.get(path, options={})
      RestClient.get(self.to_uri(path), :params => options)
    end

    def self.post(path, options={})
      RestClient.post(self.to_uri(path), {}, self.headers_for(path, options))
    end

    private
    def self.headers_for(url, options={})
      payload = {}
      payload['request'] = url
      payload['nonce'] = (Time.now.to_f * 10000).to_i.to_s
      payload.merge!(options)

      payload_enc = Base64.encode64(payload.to_json).gsub(/\s/, '')
      sig = Digest::HMAC.hexdigest(payload_enc, Bitfinex.secret, Digest::SHA384)

      { 
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'X-BFX-APIKEY' => Bitfinex.key,
        'X-BFX-PAYLOAD' => payload_enc,
        'x-BFX-SIGNATURE' => sig
      }
    end
  end
end
