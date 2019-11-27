#! /usr/bin/env ruby
# This is a leading comment
# it might have docs or something
Puppet::Parser::Functions.newfunction(:noopts) do |args|
    raise "Wrong number of args" unless args.size == 1         # arg validation
    raise "Wrong type of args" unless args.first.is_a String   # arg validation
    value = args.first                                         # arg handling

    value.length                                               # implementation
end
