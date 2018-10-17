# -*- encoding: utf-8 -*-
# stub: sdoc 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "sdoc".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Vladimir Kolesnikov".freeze, "Nathan Broadbent".freeze, "Jean Mertz".freeze, "Zachary Scott".freeze]
  s.date = "2018-02-06"
  s.description = "rdoc generator html with javascript search index.".freeze
  s.email = "voloko@gmail.com mail@zzak.io".freeze
  s.executables = ["sdoc".freeze, "sdoc-merge".freeze]
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze, "bin/sdoc".freeze, "bin/sdoc-merge".freeze]
  s.homepage = "https://github.com/zzak/sdoc".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "2.6.14".freeze
  s.summary = "rdoc html with javascript search index.".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rdoc>.freeze, [">= 5.0"])
    else
      s.add_dependency(%q<rdoc>.freeze, [">= 5.0"])
    end
  else
    s.add_dependency(%q<rdoc>.freeze, [">= 5.0"])
  end
end
