require 'watir'
require 'webdrivers'

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

def tc_01(browser)
  preparing_browser(browser)

  login_menu_item = @browser.element(:xpath => "//a[contains(text(),'Login')]")
  login_menu_item.click if login_menu_item
  sleep(5)

  if @browser.title == 'Demo web application - Login form'
    write_result(__method__, browser,:passed)
  else
    write_result(__method__, browser,:failed)
  end

  @browser.close
end

def write_result(tc_name, browser, result)
# variants of reporting strings:
# tc_01 (firefox): passed
# tc_01 (chrome): failed

  File.open(OUTPUT_FILE, 'a') {|f| f.puts"#{tc_name} (#{browser}): #{result}"}
end

preparing_files

browser_list = [:chrome, :firefox]

browser_list.each {|b| tc_01(b)}
