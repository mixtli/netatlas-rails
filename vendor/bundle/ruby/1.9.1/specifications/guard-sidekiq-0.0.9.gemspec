# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "guard-sidekiq"
  s.version = "0.0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mark Bolusmjak", "pitr"]
  s.date = "2012-10-02"
  s.description = "Guard::Sidekiq automatically starts/stops/restarts sidekiq worker"
  s.email = ["team@uken.com"]
  s.homepage = "http://github.com/uken/guard-sidekiq"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "guard gem for sidekiq"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<guard>, [">= 1.1"])
      s.add_runtime_dependency(%q<sidekiq>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0.2.0"])
      s.add_development_dependency(%q<guard-bundler>, [">= 0.1.1"])
    else
      s.add_dependency(%q<guard>, [">= 1.1"])
      s.add_dependency(%q<sidekiq>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_dependency(%q<guard-rspec>, [">= 0.2.0"])
      s.add_dependency(%q<guard-bundler>, [">= 0.1.1"])
    end
  else
    s.add_dependency(%q<guard>, [">= 1.1"])
    s.add_dependency(%q<sidekiq>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.5.0"])
    s.add_dependency(%q<guard-rspec>, [">= 0.2.0"])
    s.add_dependency(%q<guard-bundler>, [">= 0.1.1"])
  end
end
