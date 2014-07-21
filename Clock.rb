require 'rubygems'
require 'csv'
require 'selenium-webdriver'
require 'watir'

client = Selenium::WebDriver::Remote::Http::Default.new
client.timeout = 360
browser = Watir::Browser.new :firefox, :http_client => client

total = CSV.read("Links.csv").size
t1 = Time.now

CSV.foreach('Links.csv') do |link|
  t3 = Time.now
  #do stuff
  browser.goto link[0].to_s
  #done doing stuff
  t4 = Time.now
  diff =  t4 - t3
  timer = diff * total
  puts "Approx. " + timer.to_i.round.to_s + " seconds left..."
  total -= 1
end

t2 = Time.now
diff2 = t2 - t1
puts "Total time elapsed: " + diff2.to_i.round.to_s + " seconds."