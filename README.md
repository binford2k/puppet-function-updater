# Puppet Function Updater

Port legacy Puppet 3.x functions to the new function API automatically.

Run this command with a space separated list of either function file paths, or
directories containing functions. If omitted, it will default to porting all the
legacy functions, so you can just run this in the root of a Puppet module and it
will do the right thing.


## Installation

```
$ gem install puppet-function-updater
```


## Usage

Run the command `puppet_function_updater` in the root of a Puppet module, then
inspect all the generated functions for suitability.


## Limitations

This is super early in development and has not yet been battle tested.


## Disclaimer

I take no liability for the use of this tool.


Contact
-------

binford2k@gmail.com
