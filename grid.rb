require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for(:remote,url: 'http://52.213.84.182:4444/wd/hub',desired_capabilities: :firefox)
driver.get "http://google.com"

element = driver.find_element :name => "q"
element.send_keys "TRUMP 2016!!"
element.submit

puts "Page title is #{driver.title}"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.title.downcase.start_with? "trump" }

puts "Page title is #{driver.title}"
driver.quit
