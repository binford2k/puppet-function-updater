require 'erb'
require 'fileutils'

class Pfu::Generator
  def self.write(opts)
    newpath  = "lib/puppet/functions/#{opts[:namespace]}/#{opts[:name]}.rb"
    if File.exist?(newpath)
      $logger.error "Cowardly refusing to overwrite #{newpath}"
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

    $logger.info "Creating #{newpath}"
    $logger.debug "Function contents:\n#{contents}"

    begin
      # syntax check the code before writing it
      RubyVM::InstructionSequence.compile(contents)
      FileUtils.mkdir_p("lib/puppet/functions/#{opts[:namespace]}")
      File.write(newpath, contents)
    rescue Exception => e
      $logger.error "Oh crap; the generated function isn't valid Ruby code!"
      $logger.error e.message
      $logger.debug e.backtrace.join("\n")
    end

  end
end
