# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "amq-protocol"
  s.version = "0.9.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jakub Stastny", "Michael S. Klishin", "Theo Hultberg", "Mark Abramov"]
  s.date = "2012-09-24"
  s.description = "  amq-protocol is an AMQP 0.9.1 serialization library for Ruby. It is not an\n  AMQP client: amq-protocol only handles serialization and deserialization.\n  If you want to write your own AMQP client, this gem can help you with that.\n"
  s.email = ["michael@novemberain.com", "stastny@101ideas.cz"]
  s.extra_rdoc_files = ["README.md"]
  s.files = ["README.md"]
  s.homepage = "http://github.com/ruby-amqp/amq-protocol"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "amq-protocol"
  s.rubygems_version = "1.8.23"
  s.summary = "AMQP 0.9.1 encoder & decoder."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
