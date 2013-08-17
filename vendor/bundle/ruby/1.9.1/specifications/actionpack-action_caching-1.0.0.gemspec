# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "actionpack-action_caching"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Heinemeier Hansson"]
  s.date = "2013-02-28"
  s.description = "Action caching for Action Pack (removed from core in Rails 4.0)"
  s.email = "david@loudthinking.com"
  s.homepage = "https://github.com/rails/actionpack-action_caching"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Action caching for Action Pack (removed from core in Rails 4.0)"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>, ["< 5.0", ">= 4.0.0.beta"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<activerecord>, ["< 5.0", ">= 4.0.0.beta"])
    else
      s.add_dependency(%q<actionpack>, ["< 5.0", ">= 4.0.0.beta"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<activerecord>, ["< 5.0", ">= 4.0.0.beta"])
    end
  else
    s.add_dependency(%q<actionpack>, ["< 5.0", ">= 4.0.0.beta"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<activerecord>, ["< 5.0", ">= 4.0.0.beta"])
  end
end
