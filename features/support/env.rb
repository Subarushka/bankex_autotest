require 'selenium-webdriver'
require 'cucumber'
require 'rspec'
require 'rake'
require 'bundler'

require 'net/http'
require 'uri'
require 'openssl'
require 'httparty'

require "json"

Before do |scenario|
    @driver = Selenium::WebDriver.for :chrome

    @wait = Selenium::WebDriver::Wait.new(:timeout => 60)
end

After do |scenario|
    if scenario.failed?
        puts scenario.name
        puts scenario.exception.message
        @driver.save_screenshot("ERROR.png")
     else 
        @driver.close
     end 
end
