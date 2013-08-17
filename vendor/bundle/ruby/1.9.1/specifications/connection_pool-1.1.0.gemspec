# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "connection_pool"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Perham"]
  s.date = "2013-06-06"
  s.description = "Generic connection pool for Ruby"
  s.email = ["mperham@gmail.com"]
  s.homepage = "https://github.com/mperham/connection_pool"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Generic connection pool for Ruby"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, [">= 5.0.0"])
    else
      s.add_dependency(%q<minitest>, [">= 5.0.0"])
    end
  else
    s.add_dependency(%q<minitest>, [">= 5.0.0"])
  end
end
