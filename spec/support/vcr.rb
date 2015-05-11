require 'vcr'
require 'webmock/rspec'

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = false
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
  c.configure_rspec_metadata!
  c.filter_sensitive_data('BITFINEX_KEY') do |interaction|
    ENV['BITFINEX_KEY']
  end
  c.filter_sensitive_data('BITFINEX_SECRET') do |interaction|
    ENV['BITFINEX_SECRET']
  end
end
