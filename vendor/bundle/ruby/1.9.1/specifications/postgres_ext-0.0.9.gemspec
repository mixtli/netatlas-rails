# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "postgres_ext"
  s.version = "0.0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan McClain"]
  s.date = "2012-11-12"
  s.description = "Adds missing native PostgreSQL data types to ActiveRecord"
  s.email = ["git@danmcclain.net"]
  s.homepage = ""
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Extends ActiveRecord to handle native PostgreSQL data types"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, ["~> 3.2.0"])
      s.add_runtime_dependency(%q<pg_array_parser>, ["~> 0.0.8"])
      s.add_development_dependency(%q<rails>, ["~> 3.2.0"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.9.0"])
      s.add_development_dependency(%q<bourne>, ["~> 1.1.2"])
      s.add_development_dependency(%q<pg>, ["~> 0.13.2"])
      s.add_development_dependency(%q<debugger>, ["~> 1.1.2"])
      s.add_development_dependency(%q<fivemat>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, ["~> 3.2.0"])
      s.add_dependency(%q<pg_array_parser>, ["~> 0.0.8"])
      s.add_dependency(%q<rails>, ["~> 3.2.0"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.9.0"])
      s.add_dependency(%q<bourne>, ["~> 1.1.2"])
      s.add_dependency(%q<pg>, ["~> 0.13.2"])
      s.add_dependency(%q<debugger>, ["~> 1.1.2"])
      s.add_dependency(%q<fivemat>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, ["~> 3.2.0"])
    s.add_dependency(%q<pg_array_parser>, ["~> 0.0.8"])
    s.add_dependency(%q<rails>, ["~> 3.2.0"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.9.0"])
    s.add_dependency(%q<bourne>, ["~> 1.1.2"])
    s.add_dependency(%q<pg>, ["~> 0.13.2"])
    s.add_dependency(%q<debugger>, ["~> 1.1.2"])
    s.add_dependency(%q<fivemat>, [">= 0"])
  end
end
