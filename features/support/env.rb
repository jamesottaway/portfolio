WEB_DRIVER = (ENV['WEB_DRIVER'] || :firefox).to_sym

require 'watir-webdriver'
require 'watir-page-helper'
require_relative 'pages'

module Browser
  BROWSER = Watir::Browser.new WEB_DRIVER

  def visit page_class, &block
    on page_class, true, &block
  end

  def on page, visit=false, &block
    page_class = Object.const_get "#{page.to_s.split('_').map(&:capitalize).join}Page"
    page = page_class.new BROWSER, visit
    block.call page if block
    page
  end
end

World Browser

at_exit do
  Browser::BROWSER.close
end
