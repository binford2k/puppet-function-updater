# We don't actually use these, but a surprising number of functions assume them
require 'yaml'
require 'net/http'

module Puppet
  module Parser
    module Functions

      def self.newfunction(funcname, opts = {}, &block)
        return [funcname, opts, block.source_location.last]
      end

    end
  end
end

# shudder
module Kernel
  alias original_require require
  alias original_require_relative require_relative

  def require(*a, &b)
    original_require(*a, &b)
  rescue LoadError => e
    $logger.warn "The function attempted to load libraries outside the function block."
    $logger.warn "#{e.message} (ignored)"
  end

  def require_relative(*a, &b)
    original_require_relative(*a, &b)
  rescue LoadError => e
    $logger.warn "The function attempted to relatively load libraries outside the function block."
    $logger.warn "#{e.message} (ignored)"
  end
end


class Pfu::Parser
  def self.parse(path)
    return unless File.extname(path) == '.rb'
    source = File.read(path)
    lines  = source.split("\n")

    begin
      funcname, opts, lineno = eval(source)
      
      raise 'Invalid function definition' unless (funcname and opts and lineno)
    rescue => e
      $logger.error "The function in #{path} doesn't load properly!"
      $logger.error e.message
      return nil
    end

    stripcount = case source
    when /module\s+Puppet::Parser::Functions/
      2
    when /Puppet::Parser::Functions(.|::)newfunction/
      1
    end

    block = lines[(lineno-1)..-1].join("\n")
    block.gsub!(/\A.*\|\*?\w+\|/, '')                            # remove block arg string ("|args|")
    block.gsub!(/((end|})\s*){#{stripcount}}(^#.*|\s*)*\z/, '')  # remove closing block keywords and trailing comments

    heredoc = source.match(/<<-['"]?(\w+)['"]?/)
    if heredoc
      block.gsub!(/\A.*#{heredoc[1]}/m, '')
    end

    header = lines[0...(lines.index { |l| l =~ /Puppet::Parser::Functions/ })].join("\n")
    args   = lines[lineno-1..lineno].join(' ').match(/\|\s*\*?(\w+)\s*\|/)[1]

    opts[:doc]            = opts[:doc].gsub("\n", "\n#") unless opts[:doc].nil?
    opts[:name]           = funcname.to_sym
    opts[:header]         = header
    opts[:args]           = args
    opts[:implementation] = block

    opts
  end

end
