require './base_object.rb'
require './learn_component_objects/portal_main_object.rb'
require 'selenium-webdriver'

student_name = 'dnoble'
student_password = 'tardis'
portal_url = 'https://learn.staging.concord.org'
activity_url = {xpath: '//div[contains(@class,"run_buttons")]/a[contains(@href,"offerings/895.run_resource_html")]'}
# activity_run_button = {css: "a[href*='offerings/895.run_resource_html']"}

learn = PortalMainObject.new()
learn.setup_one(:chrome)
learn.visit(portal_url)
learn.verify_page("STEM Resource Finder")
learn.click_button('login')
learn.login(student_name,student_password)
# if learn.verify_auth_user('admin')
#   puts "auth user verified"
# else
#   puts "auth not verified"
# end
sleep(2)
learn.run_activity_solo(activity_url)
sleep(2)
learn.switch_to_last_tab
sleep(30)
