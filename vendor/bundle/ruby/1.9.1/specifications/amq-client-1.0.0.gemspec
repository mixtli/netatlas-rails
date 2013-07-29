# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "amq-client"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jakub Stastny", "Michael S. Klishin", "Theo Hultberg", "Mark Abramov"]
  s.date = "2013-03-23"
  s.description = "amq-client is a fully-featured, low-level AMQP 0.9.1 client with pluggable networking I/O adapters (EventMachine, cool.io, Eventpanda and so on) and supposed to back more opinionated AMQP clients (such as amqp gem) or be used directly in cases when access to more advanced AMQP 0.9.1 features is more important that convenient APIs"
  s.email = ["stastny@101ideas.cz", "michael@novemberain.com"]
  s.extra_rdoc_files = ["README.textile"]
  s.files = ["README.textile"]
  s.homepage = "http://github.com/ruby-amqp/amq-client"
  s.require_paths = ["lib"]
  s.rubyforge_project = "amq-client"
  s.rubygems_version = "1.8.23"
  s.summary = "amq-client is a fully-featured, low-level AMQP 0.9.1 client"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<eventmachine>, [">= 0"])
      s.add_runtime_dependency(%q<amq-protocol>, [">= 1.2.0"])
    else
      s.add_dependency(%q<eventmachine>, [">= 0"])
      s.add_dependency(%q<amq-protocol>, [">= 1.2.0"])
    end
  else
    s.add_dependency(%q<eventmachine>, [">= 0"])
    s.add_dependency(%q<amq-protocol>, [">= 1.2.0"])
  end
end
