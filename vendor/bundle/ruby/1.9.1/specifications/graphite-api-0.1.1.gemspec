# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "graphite-api"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eran Barak Levi"]
  s.date = "2013-05-22"
  s.description = "Graphite API - A Simple ruby client, aggregator daemon and API tools"
  s.email = "eran@kontera.com"
  s.executables = ["graphite-middleware"]
  s.files = ["bin/graphite-middleware"]
  s.homepage = "http://www.kontera.com"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubyforge_project = "graphite-api"
  s.rubygems_version = "1.8.23"
  s.summary = "Graphite Ruby Client"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<eventmachine>, [">= 0.3.3"])
      s.add_runtime_dependency(%q<zscheduler>, [">= 0.0.3"])
    else
      s.add_dependency(%q<eventmachine>, [">= 0.3.3"])
      s.add_dependency(%q<zscheduler>, [">= 0.0.3"])
    end
  else
    s.add_dependency(%q<eventmachine>, [">= 0.3.3"])
    s.add_dependency(%q<zscheduler>, [">= 0.0.3"])
  end
end
