require 'rest_client'
require 'base64'
require 'json'
require 'openssl'
require 'digest/sha2'
require 'logger'

module Bitfinex
  module Net
    INT_KEYS = [:reverse, :limit_trades, :order_id, :position_id, :limit, :offer_id, :swap_id]
    def self.to_uri(path)
      return "https://api.bitfinex.com#{path}"
    end

    def self.get(path, options={})
      begin
        RestClient.get(self.to_uri(path), :params => options)
      rescue RestClient::BadRequest => e
        raise BadRequest.new(e.response)
      end
    end

    def self.post(path, options={})
      options = stringify_value(options)
      begin
        RestClient.post(self.to_uri(path), {}, self.headers_for(path, options))
      rescue RestClient::BadRequest => e
        raise BadRequest.new(e.response)
      end
    end

    class BadRequest < RuntimeError; end

    private
    def self.stringify_value(hash)
      Hash[hash.map { |k, v| INT_KEYS.include?(k.to_sym) ? [k, v] : [k, v.to_s] }]
    end

    def self.headers_for(url, options={})
      payload = {}
      payload['request'] = url
      payload['nonce'] = (Time.now.to_f * 1_000_000_000).to_i.to_s
      payload.merge!(options)

      payload_enc = Base64.encode64(payload.to_json).gsub(/\s/, '')
      digest = OpenSSL::Digest.new('sha384')
      sig = OpenSSL::HMAC.hexdigest(digest, Bitfinex.secret, payload_enc)
      {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'X-BFX-APIKEY' => Bitfinex.key,
        'X-BFX-PAYLOAD' => payload_enc,
        'X-BFX-SIGNATURE' => sig
      }
    end
  end
end
