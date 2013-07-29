# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "guard-jasmine-headless-webkit"
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Bintz"]
  s.date = "2011-11-03"
  s.description = "Run jasmine-headless-webkit using guard"
  s.email = ["john@coswellproductions.com"]
  s.homepage = ""
  s.require_paths = ["lib"]
  s.rubyforge_project = "guard-jasmine-headless-webkit"
  s.rubygems_version = "1.8.23"
  s.summary = "Run jasmine-headless-webkit using guard"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<guard>, [">= 0.4.0"])
      s.add_runtime_dependency(%q<jasmine-headless-webkit>, [">= 0.7.0"])
    else
      s.add_dependency(%q<guard>, [">= 0.4.0"])
      s.add_dependency(%q<jasmine-headless-webkit>, [">= 0.7.0"])
    end
  else
    s.add_dependency(%q<guard>, [">= 0.4.0"])
    s.add_dependency(%q<jasmine-headless-webkit>, [">= 0.7.0"])
  end
end
