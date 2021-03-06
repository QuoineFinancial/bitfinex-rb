# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: bitfinex-rb 0.2.4 ruby lib

Gem::Specification.new do |s|
  s.name = "bitfinex-rb"
  s.version = "0.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Hoang Luu"]
  s.date = "2016-09-08"
  s.description = "Bitfinex Ruby Client"
  s.email = "unrealhoang@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".ruby-version",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bitfinex-rb.gemspec",
    "lib/bitfinex.rb",
    "lib/bitfinex/model.rb",
    "lib/bitfinex/net.rb",
    "lib/bitfinex/orders.rb",
    "lib/bitfinex/support.rb",
    "spec/bitfinex_spec.rb",
    "spec/fixtures/vcr_cassettes/bitfinex/my_trades_configured.yml",
    "spec/fixtures/vcr_cassettes/bitfinex/order_book.yml",
    "spec/fixtures/vcr_cassettes/bitfinex/order_book_limit.yml",
    "spec/fixtures/vcr_cassettes/bitfinex/ticker.yml",
    "spec/spec_helper.rb",
    "spec/support/vcr.rb"
  ]
  s.homepage = "http://github.com/unrealhoang/bitfinex-rb"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.6"
  s.summary = "Bitfinex Ruby Client"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-client>, ["~> 1.7.0"])
      s.add_runtime_dependency(%q<virtus>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
    else
      s.add_dependency(%q<rest-client>, ["~> 1.7.0"])
      s.add_dependency(%q<virtus>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    end
  else
    s.add_dependency(%q<rest-client>, ["~> 1.7.0"])
    s.add_dependency(%q<virtus>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
  end
end

