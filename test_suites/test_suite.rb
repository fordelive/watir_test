require 'watir'
require 'webdrivers'
require 'testcases'

OUTPUT_FILE = 'results.txt'.freeze

def preparing_files
  File.delete(OUTPUT_FILE) if File.exists?(OUTPUT_FILE)
end

def preparing_browser(browser)
  @browser = Watir::Browser.new(browser)
  @browser.window.maximize
  @browser.goto 'https://demoapp.strongqa.com/'
  @browser.wait_until { |b| b.title == "Demo web application - Home" }
end