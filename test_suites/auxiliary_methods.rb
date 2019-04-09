def preparing_files
  File.delete(OUTPUT_FILE) if File.exists?(OUTPUT_FILE)
end

def preparing_browser(browser)
  @browser = Watir::Browser.new(browser)
  @browser.window.maximize
  @browser.goto 'https://demoapp.strongqa.com/'
  @browser.wait_until { |b| b.title == "Demo web application - Home" }
end

def write_result(tc_name, browser, result)
# variants of reporting strings:
# tc_01 (firefox): passed
# tc_01 (chrome): failed

  File.open(OUTPUT_FILE, 'a') {|f| f.puts"#{tc_name} (#{browser}): #{result}"}
end