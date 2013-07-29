# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ember-rails"
  s.version = "0.8.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Keith Pitt", "Rob Monie", "Joao Carlos", "Paul Chavard"]
  s.date = "2012-10-27"
  s.email = ["me@keithpitt.com", "paul@chavard.net"]
  s.homepage = "https://github.com/emberjs/ember-rails"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Ember for Rails 3.1+"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<execjs>, [">= 1.2"])
      s.add_runtime_dependency(%q<railties>, ["~> 3.1"])
      s.add_runtime_dependency(%q<active_model_serializers>, [">= 0"])
      s.add_development_dependency(%q<rails>, ["~> 3.1"])
    else
      s.add_dependency(%q<execjs>, [">= 1.2"])
      s.add_dependency(%q<railties>, ["~> 3.1"])
      s.add_dependency(%q<active_model_serializers>, [">= 0"])
      s.add_dependency(%q<rails>, ["~> 3.1"])
    end
  else
    s.add_dependency(%q<execjs>, [">= 1.2"])
    s.add_dependency(%q<railties>, ["~> 3.1"])
    s.add_dependency(%q<active_model_serializers>, [">= 0"])
    s.add_dependency(%q<rails>, ["~> 3.1"])
  end
end
