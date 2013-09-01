#!/usr/bin/env ruby
#
# This file was generated by RubyGems.
#
# The application 'netatlas-poller' is installed as part of a gem, and
# this file is here to facilitate running it.
#

require 'rubygems'

version = ">= 0"

if ARGV.first
  str = ARGV.first
  str = str.dup.force_encoding("BINARY") if str.respond_to? :force_encoding
  if str =~ /\A_(.*)_\z/
    version = $1
    ARGV.shift
  end
end

gem 'netatlas-poller', version
load Gem.bin_path('netatlas-poller', 'poller.rb', version)
