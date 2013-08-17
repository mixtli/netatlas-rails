# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "her"
  s.version = "0.3.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["R\u{e9}mi Pr\u{e9}vost"]
  s.date = "2012-12-19"
  s.description = "Her is an ORM that maps REST resources and collections to Ruby objects"
  s.email = ["remi@exomel.com"]
  s.homepage = "http://remiprev.github.com/her"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "A simple Representational State Transfer-based Hypertext Transfer Protocol-powered Object Relational Mapper. Her?"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.11"])
      s.add_development_dependency(%q<yard>, ["~> 0.8"])
      s.add_development_dependency(%q<redcarpet>, ["~> 2.1"])
      s.add_development_dependency(%q<mocha>, ["~> 0.12"])
      s.add_development_dependency(%q<guard>, ["~> 1.2"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 2.3"])
      s.add_development_dependency(%q<rb-fsevent>, ["~> 0.9"])
      s.add_development_dependency(%q<growl>, ["~> 1.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<faraday>, ["~> 0.8"])
      s.add_runtime_dependency(%q<multi_json>, ["~> 1.3"])
    else
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 2.11"])
      s.add_dependency(%q<yard>, ["~> 0.8"])
      s.add_dependency(%q<redcarpet>, ["~> 2.1"])
      s.add_dependency(%q<mocha>, ["~> 0.12"])
      s.add_dependency(%q<guard>, ["~> 1.2"])
      s.add_dependency(%q<guard-rspec>, ["~> 2.3"])
      s.add_dependency(%q<rb-fsevent>, ["~> 0.9"])
      s.add_dependency(%q<growl>, ["~> 1.0"])
      s.add_dependency(%q<activesupport>, [">= 3.0.0"])
      s.add_dependency(%q<faraday>, ["~> 0.8"])
      s.add_dependency(%q<multi_json>, ["~> 1.3"])
    end
  else
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 2.11"])
    s.add_dependency(%q<yard>, ["~> 0.8"])
    s.add_dependency(%q<redcarpet>, ["~> 2.1"])
    s.add_dependency(%q<mocha>, ["~> 0.12"])
    s.add_dependency(%q<guard>, ["~> 1.2"])
    s.add_dependency(%q<guard-rspec>, ["~> 2.3"])
    s.add_dependency(%q<rb-fsevent>, ["~> 0.9"])
    s.add_dependency(%q<growl>, ["~> 1.0"])
    s.add_dependency(%q<activesupport>, [">= 3.0.0"])
    s.add_dependency(%q<faraday>, ["~> 0.8"])
    s.add_dependency(%q<multi_json>, ["~> 1.3"])
  end
end
