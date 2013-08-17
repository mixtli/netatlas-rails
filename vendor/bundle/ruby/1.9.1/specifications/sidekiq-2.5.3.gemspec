# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "sidekiq"
  s.version = "2.5.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Perham"]
  s.date = "2012-11-15"
  s.description = "Simple, efficient message processing for Ruby"
  s.email = ["mperham@gmail.com"]
  s.executables = ["sidekiq", "sidekiqctl"]
  s.files = ["bin/sidekiq", "bin/sidekiqctl"]
  s.homepage = "http://mperham.github.com/sidekiq"
  s.licenses = ["LGPL-3.0"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Simple, efficient message processing for Ruby"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<redis>, ["~> 3"])
      s.add_runtime_dependency(%q<redis-namespace>, [">= 0"])
      s.add_runtime_dependency(%q<connection_pool>, ["~> 0.9.2"])
      s.add_runtime_dependency(%q<celluloid>, ["~> 0.12.0"])
      s.add_runtime_dependency(%q<multi_json>, ["~> 1"])
      s.add_development_dependency(%q<minitest>, ["~> 4"])
      s.add_development_dependency(%q<sinatra>, [">= 0"])
      s.add_development_dependency(%q<slim>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<actionmailer>, ["~> 3"])
      s.add_development_dependency(%q<activerecord>, ["~> 3"])
    else
      s.add_dependency(%q<redis>, ["~> 3"])
      s.add_dependency(%q<redis-namespace>, [">= 0"])
      s.add_dependency(%q<connection_pool>, ["~> 0.9.2"])
      s.add_dependency(%q<celluloid>, ["~> 0.12.0"])
      s.add_dependency(%q<multi_json>, ["~> 1"])
      s.add_dependency(%q<minitest>, ["~> 4"])
      s.add_dependency(%q<sinatra>, [">= 0"])
      s.add_dependency(%q<slim>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<actionmailer>, ["~> 3"])
      s.add_dependency(%q<activerecord>, ["~> 3"])
    end
  else
    s.add_dependency(%q<redis>, ["~> 3"])
    s.add_dependency(%q<redis-namespace>, [">= 0"])
    s.add_dependency(%q<connection_pool>, ["~> 0.9.2"])
    s.add_dependency(%q<celluloid>, ["~> 0.12.0"])
    s.add_dependency(%q<multi_json>, ["~> 1"])
    s.add_dependency(%q<minitest>, ["~> 4"])
    s.add_dependency(%q<sinatra>, [">= 0"])
    s.add_dependency(%q<slim>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<actionmailer>, ["~> 3"])
    s.add_dependency(%q<activerecord>, ["~> 3"])
  end
end
