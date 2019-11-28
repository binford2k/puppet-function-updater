# Puppet Function Updater

Port legacy Puppet 3.x functions to the new function API automatically.

Run this command with a space separated list of either function file paths, or
directories containing functions. If omitted, it will default to porting all the
legacy functions, so you can just run this in the root of a Puppet module and it
will do the right thing.

See a [tutorial](https://binford2k.com/2019/11/27/automagic-function-port/) on its usage on my blog.


## Installation

```
$ gem install puppet-function-updater
```


## Usage

Run the command `puppet_function_updater` in the root of a Puppet module, then
inspect all the generated functions for suitability.

### Example:

```
[~/Projects/puppetlabs-stdlib]$ puppet_function_updater --verbose
INFO: Creating lib/puppet/functions/stdlib/abs.rb
INFO: Creating lib/puppet/functions/stdlib/any2array.rb
INFO: Creating lib/puppet/functions/stdlib/any2bool.rb
INFO: Creating lib/puppet/functions/stdlib/assert_private.rb
INFO: Creating lib/puppet/functions/stdlib/base64.rb
INFO: Creating lib/puppet/functions/stdlib/basename.rb
INFO: Creating lib/puppet/functions/stdlib/bool2num.rb
INFO: Creating lib/puppet/functions/stdlib/bool2str.rb
INFO: Creating lib/puppet/functions/stdlib/camelcase.rb
INFO: Creating lib/puppet/functions/stdlib/capitalize.rb
INFO: Creating lib/puppet/functions/stdlib/ceiling.rb
INFO: Creating lib/puppet/functions/stdlib/chomp.rb
INFO: Creating lib/puppet/functions/stdlib/chop.rb
INFO: Creating lib/puppet/functions/stdlib/clamp.rb
INFO: Creating lib/puppet/functions/stdlib/concat.rb
INFO: Creating lib/puppet/functions/stdlib/convert_base.rb
INFO: Creating lib/puppet/functions/stdlib/count.rb
INFO: Creating lib/puppet/functions/stdlib/deep_merge.rb
ERROR: The function attempted to load libraries outside the function block.
WARN: cannot load such file -- puppet/parser/functions (ignored)
INFO: Creating lib/puppet/functions/stdlib/defined_with_params.rb
INFO: Creating lib/puppet/functions/stdlib/delete.rb
INFO: Creating lib/puppet/functions/stdlib/delete_at.rb
INFO: Creating lib/puppet/functions/stdlib/delete_regex.rb
INFO: Creating lib/puppet/functions/stdlib/delete_undef_values.rb
INFO: Creating lib/puppet/functions/stdlib/delete_values.rb
INFO: Creating lib/puppet/functions/stdlib/deprecation.rb
INFO: Creating lib/puppet/functions/stdlib/difference.rb
INFO: Creating lib/puppet/functions/stdlib/dig.rb
INFO: Creating lib/puppet/functions/stdlib/dig44.rb
INFO: Creating lib/puppet/functions/stdlib/dirname.rb
INFO: Creating lib/puppet/functions/stdlib/dos2unix.rb
INFO: Creating lib/puppet/functions/stdlib/downcase.rb
INFO: Creating lib/puppet/functions/stdlib/empty.rb
INFO: Creating lib/puppet/functions/stdlib/enclose_ipv6.rb
INFO: Creating lib/puppet/functions/stdlib/ensure_packages.rb
ERROR: The function attempted to load libraries outside the function block.
WARN: cannot load such file -- puppet/parser/functions (ignored)
INFO: Creating lib/puppet/functions/stdlib/ensure_resource.rb
ERROR: The function attempted to load libraries outside the function block.
WARN: cannot load such file -- puppet/parser/functions (ignored)
INFO: Creating lib/puppet/functions/stdlib/ensure_resources.rb
INFO: Creating lib/puppet/functions/stdlib/flatten.rb
INFO: Creating lib/puppet/functions/stdlib/floor.rb
INFO: Creating lib/puppet/functions/stdlib/fqdn_rand_string.rb
INFO: Creating lib/puppet/functions/stdlib/fqdn_rotate.rb
INFO: Creating lib/puppet/functions/stdlib/fqdn_uuid.rb
INFO: Creating lib/puppet/functions/stdlib/get_module_path.rb
ERROR: The function attempted to load libraries outside the function block.
WARN: cannot load such file -- puppet/parser/functions (ignored)
INFO: Creating lib/puppet/functions/stdlib/getparam.rb
INFO: Creating lib/puppet/functions/stdlib/getvar.rb
INFO: Creating lib/puppet/functions/stdlib/glob.rb
INFO: Creating lib/puppet/functions/stdlib/grep.rb
INFO: Creating lib/puppet/functions/stdlib/has_interface_with.rb
INFO: Creating lib/puppet/functions/stdlib/has_ip_address.rb
INFO: Creating lib/puppet/functions/stdlib/has_ip_network.rb
INFO: Creating lib/puppet/functions/stdlib/has_key.rb
INFO: Creating lib/puppet/functions/stdlib/hash.rb
INFO: Creating lib/puppet/functions/stdlib/intersection.rb
INFO: Creating lib/puppet/functions/stdlib/is_absolute_path.rb
INFO: Creating lib/puppet/functions/stdlib/is_array.rb
INFO: Creating lib/puppet/functions/stdlib/is_bool.rb
INFO: Creating lib/puppet/functions/stdlib/is_domain_name.rb
INFO: Creating lib/puppet/functions/stdlib/is_email_address.rb
INFO: Creating lib/puppet/functions/stdlib/is_float.rb
INFO: Creating lib/puppet/functions/stdlib/is_function_available.rb
INFO: Creating lib/puppet/functions/stdlib/is_hash.rb
INFO: Creating lib/puppet/functions/stdlib/is_integer.rb
INFO: Creating lib/puppet/functions/stdlib/is_ip_address.rb
INFO: Creating lib/puppet/functions/stdlib/is_ipv4_address.rb
INFO: Creating lib/puppet/functions/stdlib/is_ipv6_address.rb
INFO: Creating lib/puppet/functions/stdlib/is_mac_address.rb
INFO: Creating lib/puppet/functions/stdlib/is_numeric.rb
INFO: Creating lib/puppet/functions/stdlib/is_string.rb
INFO: Creating lib/puppet/functions/stdlib/join.rb
INFO: Creating lib/puppet/functions/stdlib/join_keys_to_values.rb
INFO: Creating lib/puppet/functions/stdlib/keys.rb
INFO: Creating lib/puppet/functions/stdlib/load_module_metadata.rb
INFO: Creating lib/puppet/functions/stdlib/loadjson.rb
INFO: Creating lib/puppet/functions/stdlib/loadyaml.rb
INFO: Creating lib/puppet/functions/stdlib/lstrip.rb
INFO: Creating lib/puppet/functions/stdlib/max.rb
INFO: Creating lib/puppet/functions/stdlib/member.rb
INFO: Creating lib/puppet/functions/stdlib/merge.rb
INFO: Creating lib/puppet/functions/stdlib/min.rb
INFO: Creating lib/puppet/functions/stdlib/num2bool.rb
INFO: Creating lib/puppet/functions/stdlib/parsejson.rb
INFO: Creating lib/puppet/functions/stdlib/parseyaml.rb
INFO: Creating lib/puppet/functions/stdlib/pick.rb
INFO: Creating lib/puppet/functions/stdlib/pick_default.rb
INFO: Creating lib/puppet/functions/stdlib/prefix.rb
INFO: Creating lib/puppet/functions/stdlib/private.rb
INFO: Creating lib/puppet/functions/stdlib/pry.rb
INFO: Creating lib/puppet/functions/stdlib/pw_hash.rb
INFO: Creating lib/puppet/functions/stdlib/range.rb
INFO: Creating lib/puppet/functions/stdlib/regexpescape.rb
INFO: Creating lib/puppet/functions/stdlib/reject.rb
INFO: Creating lib/puppet/functions/stdlib/reverse.rb
INFO: Creating lib/puppet/functions/stdlib/round.rb
INFO: Creating lib/puppet/functions/stdlib/rstrip.rb
INFO: Creating lib/puppet/functions/stdlib/seeded_rand.rb
INFO: Creating lib/puppet/functions/stdlib/shell_escape.rb
INFO: Creating lib/puppet/functions/stdlib/shell_join.rb
INFO: Creating lib/puppet/functions/stdlib/shell_split.rb
INFO: Creating lib/puppet/functions/stdlib/shuffle.rb
INFO: Creating lib/puppet/functions/stdlib/size.rb
INFO: Creating lib/puppet/functions/stdlib/sort.rb
INFO: Creating lib/puppet/functions/stdlib/squeeze.rb
INFO: Creating lib/puppet/functions/stdlib/str2bool.rb
INFO: Creating lib/puppet/functions/stdlib/str2saltedsha512.rb
INFO: Creating lib/puppet/functions/stdlib/strftime.rb
INFO: Creating lib/puppet/functions/stdlib/strip.rb
INFO: Creating lib/puppet/functions/stdlib/suffix.rb
INFO: Creating lib/puppet/functions/stdlib/swapcase.rb
INFO: Creating lib/puppet/functions/stdlib/time.rb
INFO: Creating lib/puppet/functions/stdlib/to_bytes.rb
INFO: Creating lib/puppet/functions/stdlib/try_get_value.rb
INFO: Creating lib/puppet/functions/stdlib/type.rb
INFO: Creating lib/puppet/functions/stdlib/type3x.rb
INFO: Creating lib/puppet/functions/stdlib/union.rb
INFO: Creating lib/puppet/functions/stdlib/unique.rb
INFO: Creating lib/puppet/functions/stdlib/unix2dos.rb
INFO: Creating lib/puppet/functions/stdlib/upcase.rb
INFO: Creating lib/puppet/functions/stdlib/uriescape.rb
INFO: Creating lib/puppet/functions/stdlib/validate_absolute_path.rb
INFO: Creating lib/puppet/functions/stdlib/validate_array.rb
INFO: Creating lib/puppet/functions/stdlib/validate_augeas.rb
INFO: Creating lib/puppet/functions/stdlib/validate_bool.rb
ERROR: The function attempted to load libraries outside the function block.
WARN: cannot load such file -- puppet/util/execution (ignored)
INFO: Creating lib/puppet/functions/stdlib/validate_cmd.rb
INFO: Creating lib/puppet/functions/stdlib/validate_domain_name.rb
INFO: Creating lib/puppet/functions/stdlib/validate_email_address.rb
INFO: Creating lib/puppet/functions/stdlib/validate_hash.rb
INFO: Creating lib/puppet/functions/stdlib/validate_integer.rb
INFO: Creating lib/puppet/functions/stdlib/validate_ip_address.rb
INFO: Creating lib/puppet/functions/stdlib/validate_ipv4_address.rb
INFO: Creating lib/puppet/functions/stdlib/validate_ipv6_address.rb
INFO: Creating lib/puppet/functions/stdlib/validate_numeric.rb
INFO: Creating lib/puppet/functions/stdlib/validate_re.rb
INFO: Creating lib/puppet/functions/stdlib/validate_slength.rb
INFO: Creating lib/puppet/functions/stdlib/validate_string.rb
INFO: Creating lib/puppet/functions/stdlib/validate_x509_rsa_key_pair.rb
ERROR: Oh crap; the generated function isn't valid Ruby code!
ERROR: <compiled>:47: dynamic constant assignment
    NUM_ARGS = 2 unless defined? NUM_ARGS
             ^
INFO: Creating lib/puppet/functions/stdlib/values.rb
INFO: Creating lib/puppet/functions/stdlib/values_at.rb
INFO: Creating lib/puppet/functions/stdlib/zip.rb
INFO: Functions generated. Please inspect for suitability and then
INFO: update any Puppet code with the new function names.
INFO: See https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
INFO: for more information about Puppet's modern Ruby function API.
```


## Limitations

This is super early in development and has not yet been battle tested.


## Disclaimer

I take no liability for the use of this tool.


Contact
-------

binford2k@gmail.com
