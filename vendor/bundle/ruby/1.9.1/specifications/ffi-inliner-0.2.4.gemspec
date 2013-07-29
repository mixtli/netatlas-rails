# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ffi-inliner"
  s.version = "0.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrea Fazzi"]
  s.date = "2010-06-07"
  s.description = "With ffi-inliner you can run C code within your ruby script."
  s.email = "andrea.fazzi@alcacoop.it"
  s.extra_rdoc_files = ["History.txt", "README.rdoc"]
  s.files = ["History.txt", "README.rdoc"]
  s.homepage = "http://github.com/remogatto/ffi-inliner"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "ffi-inliner"
  s.rubygems_version = "1.8.23"
  s.summary = "With ffi-inliner you can run C code within your ruby script"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>, [">= 0.4.0"])
    else
      s.add_dependency(%q<ffi>, [">= 0.4.0"])
    end
  else
    s.add_dependency(%q<ffi>, [">= 0.4.0"])
  end
end
