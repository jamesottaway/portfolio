$: << File.dirname(__FILE__)

WEB_DRIVER = (ENV['WEB_DRIVER'] || :firefox).to_sym

require 'pry'
require 'jamesottaway/matchers'
require 'watir-webdriver'
require 'watir-page-helper'
require 'watir-page-helper/commands'
require 'acceptance'
require 'pages'

World Portfolio::Acceptance
World JamesOttaway::Matchers
World WatirPageHelper::Commands

WatirPageHelper.create
system 'mv portfolio.yml tmp/'

at_exit do
  WatirPageHelper.close
  system 'mv tmp/portfolio.yml .'
end
