# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "draper"
  s.version = "0.18.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeff Casimir", "Steve Klabnik"]
  s.date = "2012-10-09"
  s.description = "Draper implements a decorator or presenter pattern for Rails applications."
  s.email = ["jeff@casimircreative.com", "steve@steveklabnik.com"]
  s.homepage = "http://github.com/jcasimir/draper"
  s.require_paths = ["lib"]
  s.rubyforge_project = "draper"
  s.rubygems_version = "1.8.23"
  s.summary = "Decorator pattern implementation for Rails."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, ["~> 3.2"])
      s.add_runtime_dependency(%q<actionpack>, ["~> 3.2"])
      s.add_development_dependency(%q<ammeter>, [">= 0"])
      s.add_development_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_development_dependency(%q<rspec>, ["~> 2.10"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<minitest-rails>, ["~> 0.2"])
    else
      s.add_dependency(%q<activesupport>, ["~> 3.2"])
      s.add_dependency(%q<actionpack>, ["~> 3.2"])
      s.add_dependency(%q<ammeter>, [">= 0"])
      s.add_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_dependency(%q<rspec>, ["~> 2.10"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<minitest-rails>, ["~> 0.2"])
    end
  else
    s.add_dependency(%q<activesupport>, ["~> 3.2"])
    s.add_dependency(%q<actionpack>, ["~> 3.2"])
    s.add_dependency(%q<ammeter>, [">= 0"])
    s.add_dependency(%q<rake>, ["~> 0.9.2"])
    s.add_dependency(%q<rspec>, ["~> 2.10"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<minitest-rails>, ["~> 0.2"])
  end
end
