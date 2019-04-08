require 'watir'
require 'webdrivers'
require_relative 'testcases'
require_relative 'auxiliary_methods'

OUTPUT_FILE = 'results.txt'.freeze
USER_LOGIN = 'vlashk@ukr.net'
USER_PASSWORD = 'zse4rfvcxdr5'

preparing_files

browser_list = [:chrome, :firefox]

browser_list.each do |b|
  # tc_01(b)
  tc_02(b)
end
