# A comment! Theoretically it would tell you what the function does.
Puppet::Parser::Functions.newfunction(:direct,
              :type => :rvalue,
              :doc  => "Just a naive strlen example") do |args|
    raise "Wrong number of args" unless args.size == 1         # arg validation
    raise "Wrong type of args" unless args.first.is_a String   # arg validation
    value = args.first                                         # arg handling

    value.length                                               # implementation
end
