def tc_02(browser)
  preparing_browser(browser)

  login_menu_item = @browser.element(:xpath => "//a[contains(text(),'Login')]")
  login_menu_item.click if login_menu_item
  @browser.wait_until {|b| b.title == "Demo web application - Login form"}

  @browser.text_field(id: 'user_email').set(USER_LOGIN)
  @browser.text_field(id: 'user_password').set(USER_PASSWORD)

  submit = @browser.element(:xpath => "//input[@value='Log in']")
  submit.click
  sleep(CLICK_TIMEOUT)

  if @browser.element(:xpath => "//a[contains(text(), 'Logout')]").exists?
    write_result(__method__, browser,:passed)
  else
    write_result(__method__, browser,:failed)
  end

  @browser.close
end
