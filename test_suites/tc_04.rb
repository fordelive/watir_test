def tc_04(browser)
  # -----------------------------------tc_04.1----------------------------------
  preparing_browser(browser)

  login_menu_item = @browser.element(:xpath => "//a[contains(text(),'Login')]")
  login_menu_item.click if login_menu_item
  @browser.wait_until {|b| b.title == "Demo web application - Login form"}

  @browser.text_field(id: 'user_email').set(USER_LOGIN)
  @browser.text_field(id: 'user_password').set('')

  submit = @browser.element(:xpath => "//input[@value='Log in']")
  submit.click
  sleep(CLICK_TIMEOUT)

  tc_name = "#{__method__}.1"

  if not(@browser.element(:xpath => "//a[contains(text(), 'Logout')]").exists?) && @browser.span(id: 'flash_alert').exists?
    write_result(tc_name, browser,:passed)
  else
    write_result(tc_name, browser,:failed)
  end

  @browser.close

  # -----------------------------------tc_04.2----------------------------------
  preparing_browser(browser)

  login_menu_item = @browser.element(:xpath => "//a[contains(text(),'Login')]")
  login_menu_item.click if login_menu_item
  @browser.wait_until {|b| b.title == "Demo web application - Login form"}

  @browser.text_field(id: 'user_email').set('')
  @browser.text_field(id: 'user_password').set(USER_PASSWORD)

  submit = @browser.element(:xpath => "//input[@value='Log in']")
  submit.click
  sleep(CLICK_TIMEOUT)

  tc_name = "#{__method__}.2"

  if not(@browser.element(:xpath => "//a[contains(text(), 'Logout')]").exists?) && @browser.span(id: 'flash_alert').exists?
    write_result(tc_name, browser,:passed)
  else
    write_result(tc_name, browser,:failed)
  end

  @browser.close

  # -----------------------------------tc_04.3----------------------------------
  preparing_browser(browser)

  login_menu_item = @browser.element(:xpath => "//a[contains(text(),'Login')]")
  login_menu_item.click if login_menu_item
  @browser.wait_until {|b| b.title == "Demo web application - Login form"}

  @browser.text_field(id: 'user_email').set('')
  @browser.text_field(id: 'user_password').set('')

  submit = @browser.element(:xpath => "//input[@value='Log in']")
  submit.click
  sleep(CLICK_TIMEOUT)

  tc_name = "#{__method__}.3"

  if not(@browser.element(:xpath => "//a[contains(text(), 'Logout')]").exists?) && @browser.span(id: 'flash_alert').exists?
    write_result(tc_name, browser,:passed)
  else
    write_result(tc_name, browser,:failed)
  end

  @browser.close
end
