# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "exception_notification"
  s.version = "4.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jamis Buck", "Josh Peek"]
  s.date = "2013-07-06"
  s.email = "smartinez87@gmail.com"
  s.homepage = "http://smartinez87.github.com/exception_notification"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Exception notification for Rails apps"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionmailer>, [">= 3.0.4"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0.4"])
      s.add_development_dependency(%q<rails>, [">= 3.0.4"])
      s.add_development_dependency(%q<resque>, ["~> 1.2.0"])
      s.add_development_dependency(%q<sidekiq>, ["~> 2.0"])
      s.add_development_dependency(%q<tinder>, ["~> 1.8"])
      s.add_development_dependency(%q<httparty>, ["~> 0.10.2"])
      s.add_development_dependency(%q<mocha>, [">= 0.13.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 1.3.4"])
      s.add_development_dependency(%q<coveralls>, ["~> 0.6.5"])
      s.add_development_dependency(%q<appraisal>, [">= 0"])
    else
      s.add_dependency(%q<actionmailer>, [">= 3.0.4"])
      s.add_dependency(%q<activesupport>, [">= 3.0.4"])
      s.add_dependency(%q<rails>, [">= 3.0.4"])
      s.add_dependency(%q<resque>, ["~> 1.2.0"])
      s.add_dependency(%q<sidekiq>, ["~> 2.0"])
      s.add_dependency(%q<tinder>, ["~> 1.8"])
      s.add_dependency(%q<httparty>, ["~> 0.10.2"])
      s.add_dependency(%q<mocha>, [">= 0.13.0"])
      s.add_dependency(%q<sqlite3>, [">= 1.3.4"])
      s.add_dependency(%q<coveralls>, ["~> 0.6.5"])
      s.add_dependency(%q<appraisal>, [">= 0"])
    end
  else
    s.add_dependency(%q<actionmailer>, [">= 3.0.4"])
    s.add_dependency(%q<activesupport>, [">= 3.0.4"])
    s.add_dependency(%q<rails>, [">= 3.0.4"])
    s.add_dependency(%q<resque>, ["~> 1.2.0"])
    s.add_dependency(%q<sidekiq>, ["~> 2.0"])
    s.add_dependency(%q<tinder>, ["~> 1.8"])
    s.add_dependency(%q<httparty>, ["~> 0.10.2"])
    s.add_dependency(%q<mocha>, [">= 0.13.0"])
    s.add_dependency(%q<sqlite3>, [">= 1.3.4"])
    s.add_dependency(%q<coveralls>, ["~> 0.6.5"])
    s.add_dependency(%q<appraisal>, [">= 0"])
  end
end
