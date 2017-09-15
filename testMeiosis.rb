require '~/development/geniventure-selenium-tests/base_object.rb'
require './learn_component_objects/portal_main_object.rb'
require './geniventure_objects/geniventure_object'
require 'selenium-webdriver'

student_name = 'dnoble'
student_password = 'tardis'
portal_url = 'https://learn.staging.concord.org'
activity_url = 'https://geniventure.concord.org'

learn = PortalMainObject.new()
geniventure = GeniventureObject.new()
learn.setup_one(:chrome)
# UNCOMMENT THIS IF NEED TO TRACK STUDENT PROGRESS OR FOR DASHBOARD TESTING
# learn.visit(portal_url)
# learn.verify_page("STEM Resource Finder")
# learn.click_button('login')
# learn.login(student_name,student_password)
# # if learn.verify_auth_user('admin')
# #   puts "auth user verified"
# # else
# #   puts "auth not verified"
# # end
# learn.run_activity_solo
learn.visit(activity_url)
# learn.switch_to_main
sleep(3)
geniventure.get_map
sleep(3)
geniventure.goto_next_level
sleep(3)
geniventure.click_on_challenge_hotspot("meiosis")
sleep(3)
geniventure.save_drake
sleep(1)
geniventure.select_gender("male")
sleep(0.5)
geniventure.save_drake
sleep(3)
puts "There are #{geniventure.verify_drake_in_stable} in the stable"
geniventure.select_trait("Wingless")
sleep(3)
geniventure.save_drake
sleep(1)
geniventure.select_gender("female")
sleep(0.5)
geniventure.save_drake
sleep(2)
puts "There are #{geniventure.verify_drake_in_stable} in the stable"
sleep(3)