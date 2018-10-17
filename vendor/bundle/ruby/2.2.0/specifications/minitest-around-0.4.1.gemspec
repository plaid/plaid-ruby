# -*- encoding: utf-8 -*-
# stub: minitest-around 0.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "minitest-around".freeze
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Peter Leitzen".freeze]
  s.date = "2018-01-26"
  s.description = "Alternative for setup/teardown dance.".freeze
  s.email = ["peter-minitest-around@suschlik.de".freeze]
  s.homepage = "https://github.com/splattael/minitest-around".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Around block for minitest.".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_development_dependency(%q<rdoc>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<cucumber>.freeze, ["~> 2.4.0"])
    else
      s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_dependency(%q<rdoc>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<cucumber>.freeze, ["~> 2.4.0"])
    end
  else
    s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
    s.add_dependency(%q<rdoc>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<cucumber>.freeze, ["~> 2.4.0"])
  end
end
