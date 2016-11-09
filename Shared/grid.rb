require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for(:remote,desired_capabilities: :firefox)
#, url: 'http://172.19.0.3:5555/wd/hub'
driver.get "http://google.com"

element = driver.find_element :name => "q"
element.send_keys "Cheese!"
element.submit

puts "Page title is #{driver.title}"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.title.downcase.start_with? "cheese!" }

puts "Page title is #{driver.title}"
driver.quit
