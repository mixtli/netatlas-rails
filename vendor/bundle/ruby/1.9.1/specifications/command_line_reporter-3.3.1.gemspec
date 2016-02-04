# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "command_line_reporter"
  s.version = "3.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Wes", "Bailey"]
  s.date = "2014-02-26"
  s.description = "This gem makes it easy to provide a report while your ruby script is executing"
  s.email = "baywes@gmail.com"
  s.homepage = "http://github.com/wbailey/command_line_reporter"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "A tool for providing interactive command line applications"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<colored>, [">= 1.2"])
    else
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<colored>, [">= 1.2"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<colored>, [">= 1.2"])
  end
end
