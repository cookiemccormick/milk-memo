
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "milk-memo/version"

Gem::Specification.new do |spec|
  spec.name          = "milk-memo"
  spec.version       = Milk::Memo::VERSION
  spec.authors       = ["Alisa Cookie McCormick"]
  spec.email         = ["alisa.cookie.mccormick@gmail.com"]

  spec.summary       = %q{Milk Memo is a Sinatra app for tracking your pregnancy.}
  spec.homepage      = "https://github.com/cookiemccormick/milk-memo"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  development_dependency "rake", "~> 10.0"
end