# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "net-snmp"
  s.version = "0.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ron McClain"]
  s.date = "2012-03-15"
  s.description = "Uses ffi to create an object oriented wrapper around C net-snmp libraries"
  s.email = ["mixtli@github.com"]
  s.executables = ["snmpget.rb", "stress_test.rb"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["bin/snmpget.rb", "bin/stress_test.rb", "README.rdoc"]
  s.homepage = "https://github.com/mixtli/net-snmp"
  s.rdoc_options = ["--main=README.rdoc", "--line-numbers", "--inline-source", "--title=net-snmp-0.2.5 Documentation"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "net-snmp"
  s.rubygems_version = "1.8.23"
  s.summary = "Object oriented wrapper around C net-snmp libraries"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi-inliner>, [">= 0"])
      s.add_runtime_dependency(%q<nice-ffi>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<eventmachine>, [">= 0"])
    else
      s.add_dependency(%q<ffi-inliner>, [">= 0"])
      s.add_dependency(%q<nice-ffi>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<eventmachine>, [">= 0"])
    end
  else
    s.add_dependency(%q<ffi-inliner>, [">= 0"])
    s.add_dependency(%q<nice-ffi>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<eventmachine>, [">= 0"])
  end
end
