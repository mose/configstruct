Configstruct
=============

[![Gem Version](https://badge.fury.io/rb/configstruct.png)](http://rubygems.org/gems/configstruct)
[![Build Status](https://travis-ci.org/mose/configstruct.png?branch=master)](https://travis-ci.org/mose/configstruct)
[![Coverage Status](https://coveralls.io/repos/mose/configstruct/badge.png)](https://coveralls.io/r/mose/configstruct)
[![Dependency Status](https://gemnasium.com/mose/configstruct.svg)](https://gemnasium.com/mose/configstruct)
[![Code Climate](https://codeclimate.com/github/mose/configstruct.png)](https://codeclimate.com/github/mose/configstruct)

----

This gem is a lib for managing configfile for cli applications, including

- setup of the config file if it does not exist, using cli prompt
- edit configuration and update the config file

It's for now totally experimental, please do not use yet.

## Installation

Add this line to your application's Gemfile:

    gem 'configstruct'

## Usage

````ruby
class Config < ConfigStruct

  def set_defaults
    super
    self.name ||= 'default'
    self.url ||= 'http://hackpad.com'
  end

  def setup
    values = {}
    output.puts Paint['Workspace configuration.', :blue]
    output.puts Paint['Gather your information from https://<workspace>.hackpad.com/ep/account/settings/', :bold]
    values['client_id'] = guess 'HPCLI_CLIENTID', 'What is your Client ID?'
    values['secret'] = guess 'HPCLI_SECRET', 'What is your Secret Key?'
    values['site'] = guess('HPCLI_URL', 'What is the URI of your workspace? (ex. https://xxx.hackapd.com)').gsub(/\/$/, '')
    write(values)
  end

end
````



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Copyright
----------

(c) Copy is right, 2014 - mose - this code is distributed under MIT license

