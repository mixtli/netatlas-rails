# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rainbow"
  s.version = "1.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marcin Kulik"]
  s.date = "2012-04-28"
  s.email = "marcin.kulik@gmail.com"
  s.homepage = "http://ku1ik.com/"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Rainbow extends ruby String class enabling coloring text on ANSI terminals"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
