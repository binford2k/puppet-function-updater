$:.unshift File.expand_path("../lib", __FILE__)
require 'pfu/version'
require 'date'

Gem::Specification.new do |s|
  s.name              = "puppet-function-updater"
  s.version           = Pfu::VERSION
  s.date              = Date.today.to_s
  s.summary           = "Automagically ports legacy Puppet functions to the modern API."
  s.license           = 'Apache-2.0'
  s.email             = "ben.ford@puppet.com"
  s.authors           = ["Ben Ford"]
  s.require_path      = "lib"
  s.executables       = %w( puppet_function_updater )
  s.files             = %w( README.md LICENSE CHANGELOG.md )
  s.files            += Dir.glob("lib/**/*")
  s.files            += Dir.glob("bin/**/*")
  s.files            += Dir.glob("templates/**/*")

  s.description       = <<-desc
Run this command with a space separated list of either function file paths, or
directories containing functions. If omitted, it will default to porting all the
legacy functions, so you can just run this in the root of a Puppet module and it
will do the right thing.
  desc

end
