$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "graphql_core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "graphql_core"
  spec.version     = GraphqlCore::VERSION
  spec.authors     = ["davidlarochelle"]
  spec.email       = ["dlarochelle@fungo.ca"]
  spec.summary       = %q{GraphQL Helpers}
  spec.description   = %q{Provides GraphQL useful graphql modules}
  spec.homepage      = "https://github.com/groupefungo/graphql_core-core"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.2", ">= 6.0.2.1"
  spec.add_dependency 'graphql'

  spec.add_development_dependency 'factory_bot'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rspec-rails', '~> 4.0'
  spec.add_development_dependency 'sqlite3', '~> 1.3'
end
