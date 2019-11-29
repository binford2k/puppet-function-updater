require 'erb'
require 'fileutils'

class Pfu::Generator
  def self.write(opts)
    newpath  = "lib/puppet/functions/#{opts[:namespace]}/#{opts[:name]}.rb"
    specpath = "spec/functions/#{opts[:namespace]}_#{opts[:name]}_spec.rb"

    [newpath, specpath].each do |path|
      next unless File.exist?(path)
      $logger.error "Cowardly refusing to overwrite #{path}"
      return
    end

    opts[:fullname] = case opts[:namespace]
    when '', nil
      opts[:name]
    else
      "#{opts[:namespace]}::#{opts[:name]}"
    end

    template = File.join(File.dirname(__FILE__), '..', '..', 'templates', 'function.erb')
    contents = ERB.new(File.read(template), nil, '-').result(binding)

    template = File.join(File.dirname(__FILE__), '..', '..', 'templates', 'function_spec.erb')
    specfile = ERB.new(File.read(template), nil, '-').result(binding)

    $logger.info "Creating #{newpath}"
    $logger.debug "Function contents:\n#{contents}"

    begin
      # syntax check the code before writing it
      # TODO: validate that it actually creates a puppet function
      RubyVM::InstructionSequence.compile(contents)

      FileUtils.mkdir_p("lib/puppet/functions/#{opts[:namespace]}")
      File.write(newpath, contents)

      FileUtils.mkdir_p("spec/functions")
      File.write(specpath, specfile)

      return true
    rescue Exception => e
      $logger.error "Oh crap; the generated function isn't valid Ruby code!"
      $logger.error e.message
      $logger.debug e.backtrace.join("\n")
      return false
    end

  end
end
