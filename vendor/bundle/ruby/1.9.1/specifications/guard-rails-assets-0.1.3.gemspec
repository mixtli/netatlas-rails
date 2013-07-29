# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "guard-rails-assets"
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dmytrii Nagirniak"]
  s.date = "2011-11-19"
  s.description = "guard-rails-assets automatically generates JavaScript, CSS, Image files using Rails assets pipelie"
  s.email = ["dnagir@gmail.com"]
  s.homepage = "http://github.com/dnagir/guard-rails-assets"
  s.require_paths = ["lib"]
  s.rubyforge_project = "guard-rails-assets"
  s.rubygems_version = "1.8.23"
  s.summary = "Guard for compiling Rails assets"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<guard>, [">= 0"])
      s.add_runtime_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<rails>, [">= 3.1.1"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<guard>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 3.1.1"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<guard>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 3.1.1"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
