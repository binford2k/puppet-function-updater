module Puppet::Parser::Functions
  newfunction(:module,
              :type => :rvalue,
              :doc  => "Just a naive strlen example") do |args|
    raise "Wrong number of args" unless args.size == 1         # arg validation
    raise "Wrong type of args" unless args.first.is_a String   # arg validation
    value = args.first                                         # arg handling

    value.length                                               # implementation
  end
end
# vim: set expandtab:
