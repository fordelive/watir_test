require 'watir'
require 'webdrivers'
require_relative 'auxiliary_methods'

Dir['tc_??.rb'].each {|file| require_relative file}


CLICK_TIMEOUT = 0
OUTPUT_FILE = 'results.txt'.freeze
USER_LOGIN = 'vlashk@ukr.net'
USER_PASSWORD = 'zse4rfvcxdr5'

INCORRECT_LOGIN = 'blabla@mail.net'
INCORRECT_PASSWORD = '123456'

preparing_files

BROWSER_LIST = [:chrome, :firefox]

BROWSER_LIST.each do |browser|
  tc_01(browser)
  tc_02(browser)
  tc_03(browser)
  tc_04(browser)
  tc_05(browser)
end
