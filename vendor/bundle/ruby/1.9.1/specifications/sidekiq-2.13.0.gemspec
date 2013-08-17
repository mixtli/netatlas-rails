# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "sidekiq"
  s.version = "2.13.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Perham"]
  s.date = "2013-07-09"
  s.description = "Simple, efficient background processing for Ruby"
  s.email = ["mperham@gmail.com"]
  s.executables = ["sidekiq", "sidekiqctl"]
  s.files = ["bin/sidekiq", "bin/sidekiqctl"]
  s.homepage = "http://sidekiq.org"
  s.licenses = ["LGPL-3.0"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Simple, efficient background processing for Ruby"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<redis>, [">= 3.0"])
      s.add_runtime_dependency(%q<redis-namespace>, [">= 0"])
      s.add_runtime_dependency(%q<connection_pool>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<celluloid>, [">= 0.14.1"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<sinatra>, [">= 0"])
      s.add_development_dependency(%q<slim>, [">= 1.1.0"])
      s.add_development_dependency(%q<minitest>, ["~> 5"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<actionmailer>, [">= 0"])
      s.add_development_dependency(%q<activerecord>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
    else
      s.add_dependency(%q<redis>, [">= 3.0"])
      s.add_dependency(%q<redis-namespace>, [">= 0"])
      s.add_dependency(%q<connection_pool>, [">= 1.0.0"])
      s.add_dependency(%q<celluloid>, [">= 0.14.1"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<sinatra>, [">= 0"])
      s.add_dependency(%q<slim>, [">= 1.1.0"])
      s.add_dependency(%q<minitest>, ["~> 5"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<actionmailer>, [">= 0"])
      s.add_dependency(%q<activerecord>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
    end
  else
    s.add_dependency(%q<redis>, [">= 3.0"])
    s.add_dependency(%q<redis-namespace>, [">= 0"])
    s.add_dependency(%q<connection_pool>, [">= 1.0.0"])
    s.add_dependency(%q<celluloid>, [">= 0.14.1"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<sinatra>, [">= 0"])
    s.add_dependency(%q<slim>, [">= 1.1.0"])
    s.add_dependency(%q<minitest>, ["~> 5"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<actionmailer>, [">= 0"])
    s.add_dependency(%q<activerecord>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
  end
end
