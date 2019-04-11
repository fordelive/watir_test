def tc_01(browser)
  preparing_browser(browser)

  login_menu_item = @browser.element(:xpath => "//a[contains(text(),'Login')]")
  login_menu_item.click if login_menu_item
  sleep(CLICK_TIMEOUT)

  if @browser.title == 'Demo web application - Login form'
    write_result(__method__, browser,:passed)
  else
    write_result(__method__, browser,:failed)
  end

  @browser.close
end
