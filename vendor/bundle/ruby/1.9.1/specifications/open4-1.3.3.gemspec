# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "open4"
  s.version = "1.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ara T. Howard"]
  s.date = "2014-03-03"
  s.description = "open child process with handles on pid, stdin, stdout, and stderr: manage child processes and their io handles easily."
  s.email = "ara.t.howard@gmail.com"
  s.homepage = "https://github.com/ahoward/open4"
  s.licenses = ["Ruby"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "codeforpeople"
  s.rubygems_version = "1.8.23"
  s.summary = "open4"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
