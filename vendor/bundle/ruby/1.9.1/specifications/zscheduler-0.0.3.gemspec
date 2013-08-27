# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "zscheduler"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eran Barak Levi"]
  s.date = "2013-05-09"
  s.description = "minimalistic scheduler on top of event-machine "
  s.email = "wtf@wtf.com"
  s.homepage = "http://github.com/eranb/zscheduler"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.5")
  s.rubyforge_project = "zscheduler"
  s.rubygems_version = "1.8.23"
  s.summary = "minimalistic scheduler on top of event-machine"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<eventmachine>, [">= 0"])
    else
      s.add_dependency(%q<eventmachine>, [">= 0"])
    end
  else
    s.add_dependency(%q<eventmachine>, [">= 0"])
  end
end
