module Puppet
  module Parser
    module Functions

      def self.newfunction(funcname, opts = {}, &block)
        return [funcname, opts, block.source_location.last]
      end

    end
  end
end


class Pfu::Parser
  def self.parse(path)
    source = File.read(path)
    lines  = source.split("\n")

    funcname, opts, lineno = eval(source)


    stripcount = case source
    when /module\s+Puppet::Parser::Functions/
      2
    when /Puppet::Parser::Functions.newfunction/
      1
    end

    block = lines[(lineno-1)..-1].join("\n")
    block.gsub!(/\A.*\|\w+\|/, '')                               # remove block arg string ("|args|")
    block.gsub!(/((end|})\s*){#{stripcount}}(^#.*|\s*)*\z/, '')  # remove closing block keywords and trailing comments

    header = lines[0...(lines.index { |l| l =~ /Puppet::Parser::Functions/ })].join("\n")
    args   = lines[lineno-1].match(/\|\s*(\w+)\s*\|/)[1]


    opts[:name]           = funcname.to_sym
    opts[:header]         = header
    opts[:args]           = args
    opts[:implementation] = block

    opts
  end

end
