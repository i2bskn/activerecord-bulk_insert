lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "active_record/bulk_insert/version"

Gem::Specification.new do |spec|
  spec.name          = "activerecord-bulk_insert"
  spec.version       = Activerecord::BulkInsert::VERSION
  spec.authors       = ["i2bskn"]
  spec.email         = ["i2bskn@craftake.com"]

  spec.summary       = "Bulk insert or update"
  spec.description   = "Bulk insert or update"
  spec.homepage      = "https://github.com/i2bskn/activerecord-bulk_insert"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/i2bskn/activerecord-bulk_insert"
  spec.metadata["changelog_uri"] = "https://github.com/i2bskn/activerecord-bulk_insert/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "~> 6.0"
  spec.add_dependency "activesupport", "~> 6.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "pry", "~> 0.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.74"
end
