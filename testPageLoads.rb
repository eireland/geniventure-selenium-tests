require './geniventure_objects/geniventure_object.rb'

browser = :chrome

# expected_screenshot_dir = "#{Dir.home}/Sites/doc_screenshot_results/expected_screenshots/"
# test_screenshot_dir = "#{Dir.home}/Sites/doc_screenshot_results/test_screenshots/"
expected_screenshot_dir = "#{Dir.home}/Sites/doc_screenshot_results/expected_screenshots/"
test_screenshot_dir = "./test_screenshots/"+browser.to_s
GV_BASE_URL = "https://geniventure.concord.org/#"
gv_pages = ["/home","/1/1/1","/2/1/1","/2/1/2","/2/2/1","/2/2/2","/2/3/1","/2/3/2","/2/3/3","/2/3/4","/3/1/1","/3/1/2","/3/2/1"]
GV_BASE_ID = {id:"gv"}
CHALLENGES = {id:"enter-challenge-hotspot"}
`rm -rf #{test_screenshot_dir}`
`mkdir -p #{test_screenshot_dir}`

browser = :chrome
gv=GeniventureObject.new()
gv.setup_one(browser)
gv_pages.each do |page|
  url = GV_BASE_URL + page
  puts "url is #{url}"
  gv.visit(url)
  sleep(20)
  gv.save_screenshot(test_screenshot_dir,url, browser)
  sleep(5)
  if (page != "/home" )
    gv.click_on_challenge_hotspot("sim room")
    sleep(20)
    gv.save_screenshot(test_screenshot_dir,url, browser)
    sleep(5)
  end
end
gv.teardown
