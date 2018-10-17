# -*- encoding: utf-8 -*-
# stub: vcr 4.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "vcr".freeze
  s.version = "4.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Myron Marston".freeze]
  s.date = "2017-12-04"
  s.description = "Record your test suite's HTTP interactions and replay them during future test runs for fast, deterministic, accurate tests.".freeze
  s.email = ["myron.marston@gmail.com".freeze]
  s.homepage = "https://relishapp.com/vcr/vcr/docs".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Record your test suite's HTTP interactions and replay them during future test runs for fast, deterministic, accurate tests.".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<test-unit>.freeze, ["~> 3.1.4"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.1"])
      s.add_development_dependency(%q<pry>.freeze, ["~> 0.9"])
      s.add_development_dependency(%q<pry-doc>.freeze, ["~> 0.6"])
      s.add_development_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0.4"])
      s.add_development_dependency(%q<yard>.freeze, [">= 0"])
      s.add_development_dependency(%q<rack>.freeze, [">= 0"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_development_dependency(%q<cucumber>.freeze, ["~> 2.0.2"])
      s.add_development_dependency(%q<aruba>.freeze, ["~> 0.5.3"])
      s.add_development_dependency(%q<faraday>.freeze, ["~> 0.11.0"])
      s.add_development_dependency(%q<httpclient>.freeze, [">= 0"])
      s.add_development_dependency(%q<excon>.freeze, [">= 0"])
      s.add_development_dependency(%q<timecop>.freeze, [">= 0"])
      s.add_development_dependency(%q<multi_json>.freeze, [">= 0"])
      s.add_development_dependency(%q<json>.freeze, [">= 0"])
      s.add_development_dependency(%q<relish>.freeze, [">= 0"])
      s.add_development_dependency(%q<mime-types>.freeze, [">= 0"])
      s.add_development_dependency(%q<sinatra>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<test-unit>.freeze, ["~> 3.1.4"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.1"])
      s.add_dependency(%q<pry>.freeze, ["~> 0.9"])
      s.add_dependency(%q<pry-doc>.freeze, ["~> 0.6"])
      s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0.4"])
      s.add_dependency(%q<yard>.freeze, [">= 0"])
      s.add_dependency(%q<rack>.freeze, [">= 0"])
      s.add_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_dependency(%q<cucumber>.freeze, ["~> 2.0.2"])
      s.add_dependency(%q<aruba>.freeze, ["~> 0.5.3"])
      s.add_dependency(%q<faraday>.freeze, ["~> 0.11.0"])
      s.add_dependency(%q<httpclient>.freeze, [">= 0"])
      s.add_dependency(%q<excon>.freeze, [">= 0"])
      s.add_dependency(%q<timecop>.freeze, [">= 0"])
      s.add_dependency(%q<multi_json>.freeze, [">= 0"])
      s.add_dependency(%q<json>.freeze, [">= 0"])
      s.add_dependency(%q<relish>.freeze, [">= 0"])
      s.add_dependency(%q<mime-types>.freeze, [">= 0"])
      s.add_dependency(%q<sinatra>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<test-unit>.freeze, ["~> 3.1.4"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.1"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.9"])
    s.add_dependency(%q<pry-doc>.freeze, ["~> 0.6"])
    s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0.4"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
    s.add_dependency(%q<rack>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
    s.add_dependency(%q<cucumber>.freeze, ["~> 2.0.2"])
    s.add_dependency(%q<aruba>.freeze, ["~> 0.5.3"])
    s.add_dependency(%q<faraday>.freeze, ["~> 0.11.0"])
    s.add_dependency(%q<httpclient>.freeze, [">= 0"])
    s.add_dependency(%q<excon>.freeze, [">= 0"])
    s.add_dependency(%q<timecop>.freeze, [">= 0"])
    s.add_dependency(%q<multi_json>.freeze, [">= 0"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<relish>.freeze, [">= 0"])
    s.add_dependency(%q<mime-types>.freeze, [">= 0"])
    s.add_dependency(%q<sinatra>.freeze, [">= 0"])
  end
end
