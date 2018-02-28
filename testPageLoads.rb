require './geniventure_objects/geniventure_object.rb'
require './learn_component_objects/portal_main_object.rb'

student_name = 'msmith'
student_password = 'tardis'
portal_url = 'https://learn.staging.concord.org'
activity_url = {xpath: '//div[contains(@class,"run_buttons")]/a[contains(@href,"offerings/895.run_resource_html")]'}

def login(learn)
  portal_url = 'https://learn.staging.concord.org'
  student_name = 'msmith'
  student_password = 'tardis'
  activity_url = {xpath: '//div[contains(@class,"run_buttons")]/a[contains(@href,"offerings/895.run_resource_html")]'}

  learn.visit(portal_url)
  learn.verify_page("STEM Resource Finder")
  learn.click_button('login')
  learn.login(student_name,student_password)
  sleep(2)
  learn.run_activity_solo(activity_url)
  sleep(2)
  learn.switch_to_last_tab
  sleep(30)
  return learn.get_url
end

browser = :firefox

expected_screenshot_dir = "#{Dir.home}/Sites/gv_screenshot_results/expected_screenshots/"
test_screenshot_dir = "#{Dir.home}/Sites/gv_screenshot_results/test_screenshots/"
test_screenshot_dir = "./test_screenshots/"+browser.to_s
GV_BASE_URL = "https://geniventure.concord.org/#"


gv_pages = ["/home","/1/1/1","1/2/1","1/2/2","1/2/3","1/2/4","/2/1/1","/2/1/2","/2/2/1","/2/2/2","/2/2/3","/2/3/1","/2/3/2","/2/3/3","/2/3/4","/2/3/5","/3/1/1","/3/1/2","/3/1/3","/3/1/4","/3/1/5","/3/1/6","/3/1/7","/3/1/8","/3/2/1","/3/2/2","/3/2/3","/3/2/4","/3/3/1","/3/3/2","/3/3/3","/3/4/1","/3/4/2","/3/4/3","/4/1/1","/4/1/2","/4/1/3","/4/1/4","/4/1/5","/4/1/6","/4/1/7","/4/1/8","/4/2/1","/4/2/2", "/4/2/3","/4/2/4","/4/2/5","/4/3/1","/4/3/2","/4/3/3","/5/1/1","/5/1/2","/5/1/3"]
# gv_pages = ["/1/1/1","1/2/1","1/2/3"]
# gv_pages = ["/4/2/1","/4/2/2", "/4/2/3","/4/2/4","/4/2/5","/4/3/1","/4/3/2","/4/3/3","/5/1/1","/5/1/2","/5/1/3"]
# gv_pages = ["/5/1/1"]
`rm -rf #{test_screenshot_dir}`
`mkdir -p #{test_screenshot_dir}`

gv=GeniventureObject.new()
# learn=PortalMainObject.new()
gv.setup_one(browser)
# GV_URL=login(learn)
# GV_BASE_URL = GV_URL.chomp('/home')
count=0

gv_pages.each do |page|
  url = GV_BASE_URL + page
  gv.visit(url)
  sleep(30)
  # if gv.done_loading?
    gv.save_screenshot(test_screenshot_dir,url+"_"+count.to_s)
    sleep(5)
    if (page.include? "4/2/") || (page.include? "4/3/") || (page.include? "5/1/")
      gv.click_on_challenge_hotspot("breeding barn")
      sleep(10)
      # if gv.done_loading?
        gv.save_screenshot(test_screenshot_dir,url+"_"+count.to_s)
        sleep(5)
      # end
    elsif (page != "/home" )
      gv.click_on_challenge_hotspot("sim room")
      sleep(10)
      # if gv.done_loading?
        gv.save_screenshot(test_screenshot_dir,url+"_"+count.to_s)
        sleep(5)
      # end
    count+=1
  # end
  end
  end
gv.teardown

