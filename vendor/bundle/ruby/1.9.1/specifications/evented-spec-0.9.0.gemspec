# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "evented-spec"
  s.version = "0.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Arvicco", "Markiz"]
  s.date = "2011-07-24"
  s.description = "Simple API for writing asynchronous EventMachine and AMQP specs. Runs legacy EM-Spec based examples. Supports RSpec and RSpec2."
  s.email = "arvitallian@gmail.com"
  s.extra_rdoc_files = ["LICENSE", "HISTORY", "README.textile"]
  s.files = ["LICENSE", "HISTORY", "README.textile"]
  s.homepage = "http://github.com/ruby-amqp/evented-spec"
  s.rdoc_options = ["--charset", "UTF-8", "--main", "README.textile", "--title", "evented-spec"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "evented-spec"
  s.rubygems_version = "1.8.23"
  s.summary = "Simple API for writing asynchronous EventMachine/AMQP specs. Supports RSpec and RSpec2."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_development_dependency(%q<amqp>, ["~> 0.8.0.rc1"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<RedCloth>, ["~> 4.2.7"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_dependency(%q<amqp>, ["~> 0.8.0.rc1"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<RedCloth>, ["~> 4.2.7"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.5.0"])
    s.add_dependency(%q<amqp>, ["~> 0.8.0.rc1"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<RedCloth>, ["~> 4.2.7"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end
