# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vue_delayed_job_dashboard/version'

Gem::Specification.new do |spec|
  spec.name          = "vue_delayed_job_dashboard"
  spec.version       = VueDelayedJobDashboard::VERSION
  spec.authors       = ["Long Nguyen"]
  spec.email         = ["long.polyglot@gmail.com"]

  spec.summary       = %q{Modern DelayedJob Dashboard}
  spec.description   = %q{Modern DelayedJob Dashboard built with VueJS and Sinatra.}
  spec.homepage      = "https://github.com/kimquy/delayed_job_dashboard"
  spec.license       = "MIT"

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
