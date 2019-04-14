require 'watir'
require 'selenium-webdriver'
require 'pry'
# require 'webdriver'
# require 'launchy'

browser = Watir::Browser.start('google.com', :firefox)  # fonctionne aussi -ou- ci-dessous
# browser = Watir::Browser.new(:firefox) 
# browser.goto 'google.com'


search_bar = browser.text_field(class: 'gsfi')
search_bar.set("how to center a div")

# je frappe la touche entrée
#search_bar.send_keys(:enter)

# ou je clique sur le bouton "loupe"
submit_button = browser.button(type:"submit")
submit_button.click

# j'attends 3sec
browser.driver.manage.timeouts.implicit_wait = 3
#browser.div(class:"rc")
search_result_divs = browser.divs(class:"rc")
search_result_urls = browser.cites(class:"a")
search_result_divs.each { | div | p div.h3.text }
search_result_urls.each { | url | p div.cite.text }

browser.close
