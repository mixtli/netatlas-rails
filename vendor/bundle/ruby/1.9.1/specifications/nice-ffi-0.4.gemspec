# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "nice-ffi"
  s.version = "0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Croisant"]
  s.date = "2010-03-30"
  s.description = "Nice-FFI is a layer on top of Ruby-FFI (and compatible FFI systems)\nwith features to ease development of FFI-based libraries.\n"
  s.email = "jacius@gmail.com"
  s.homepage = "http://github.com/jacius/nice-ffi/"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8")
  s.rubyforge_project = "nice-ffi"
  s.rubygems_version = "1.8.23"
  s.summary = "Convenience layer atop Ruby-FFI"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>, [">= 0.5.0"])
    else
      s.add_dependency(%q<ffi>, [">= 0.5.0"])
    end
  else
    s.add_dependency(%q<ffi>, [">= 0.5.0"])
  end
end
