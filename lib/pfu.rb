class Pfu
  require 'pfu/parser'
  require 'pfu/generator'
  require 'pfu/version'

  def initialize(options)
    @filenames = options[:filenames]
    @namespace = options[:namespace]
  end

  def refactor!
    @filenames.each do |path|
      next unless data = Pfu::Parser.parse(path)
      data[:namespace] = @namespace
      Pfu::Generator.write(data)
    end

    $logger.info "Functions generated. Please inspect for suitability and then"
    $logger.info "update any Puppet code with the new function names."
    $logger.info "See https://puppet.com/docs/puppet/latest/custom_functions_ruby.html"
    $logger.info "for more information about Puppet's modern Ruby function API."
  end
end
