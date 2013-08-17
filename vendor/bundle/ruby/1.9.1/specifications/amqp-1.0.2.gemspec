# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "amqp"
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aman Gupta", "Jakub Stastny aka botanicus", "Michael S. Klishin"]
  s.date = "2013-04-26"
  s.description = "Widely used, feature-rich asynchronous RabbitMQ client with batteries included."
  s.email = ["michael@novemberain.com", "stastny@101ideas.cz"]
  s.extra_rdoc_files = ["README.md", "docs/Durability.textile", "docs/Exchanges.textile", "docs/PatternsAndUseCases.textile", "docs/ConnectingToTheBroker.textile", "docs/ConnectionEncryptionWithTLS.textile", "docs/RunningTests.textile", "docs/DocumentationGuidesIndex.textile", "docs/Troubleshooting.textile", "docs/RabbitMQVersions.textile", "docs/Queues.textile", "docs/08Migration.textile", "docs/VendorSpecificExtensions.textile", "docs/AMQP091ModelExplained.textile", "docs/Bindings.textile", "docs/GettingStarted.textile", "docs/ErrorHandling.textile", "docs/Clustering.textile", "docs/TestingWithEventedSpec.textile"]
  s.files = ["README.md", "docs/Durability.textile", "docs/Exchanges.textile", "docs/PatternsAndUseCases.textile", "docs/ConnectingToTheBroker.textile", "docs/ConnectionEncryptionWithTLS.textile", "docs/RunningTests.textile", "docs/DocumentationGuidesIndex.textile", "docs/Troubleshooting.textile", "docs/RabbitMQVersions.textile", "docs/Queues.textile", "docs/08Migration.textile", "docs/VendorSpecificExtensions.textile", "docs/AMQP091ModelExplained.textile", "docs/Bindings.textile", "docs/GettingStarted.textile", "docs/ErrorHandling.textile", "docs/Clustering.textile", "docs/TestingWithEventedSpec.textile"]
  s.homepage = "http://rubyamqp.info"
  s.licenses = ["Ruby"]
  s.rdoc_options = ["--include=examples --main README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "amqp"
  s.rubygems_version = "1.8.23"
  s.summary = "Widely used, feature-rich asynchronous RabbitMQ client with batteries included"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<eventmachine>, [">= 0"])
      s.add_runtime_dependency(%q<amq-client>, ["~> 1.0.2"])
      s.add_runtime_dependency(%q<amq-protocol>, [">= 1.3.0"])
    else
      s.add_dependency(%q<eventmachine>, [">= 0"])
      s.add_dependency(%q<amq-client>, ["~> 1.0.2"])
      s.add_dependency(%q<amq-protocol>, [">= 1.3.0"])
    end
  else
    s.add_dependency(%q<eventmachine>, [">= 0"])
    s.add_dependency(%q<amq-client>, ["~> 1.0.2"])
    s.add_dependency(%q<amq-protocol>, [">= 1.3.0"])
  end
end
