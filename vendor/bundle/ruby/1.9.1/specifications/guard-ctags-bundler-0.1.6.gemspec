# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "guard-ctags-bundler"
  s.version = "0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ivan Tkalin"]
  s.date = "2012-09-17"
  s.description = "Guard::CtagsBundler uses ctags utility and generates 2 files: tags -- with tags generated from project's source tree and gems.tags -- with tags generated from rubygems from project's bundle."
  s.email = ["itkalin@gmail.com"]
  s.homepage = "https://github.com/ivalkeen/guard-ctags-bundler"
  s.require_paths = ["lib"]
  s.rubyforge_project = "guard-ctags-bundler"
  s.rubygems_version = "1.8.23"
  s.summary = "Guard gem for generating ctags for project files and gems from project's bundle."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<guard>, [">= 1.1"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<purdytest>, [">= 0"])
    else
      s.add_dependency(%q<guard>, [">= 1.1"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<purdytest>, [">= 0"])
    end
  else
    s.add_dependency(%q<guard>, [">= 1.1"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<purdytest>, [">= 0"])
  end
end
