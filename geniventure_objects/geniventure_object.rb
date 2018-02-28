require '~/development/geniventure-selenium-tests/base_object.rb'
require "./geniventure_objects/egg_basket_object"
require "./geniventure_objects/meiosis_object"
require "./geniventure_objects/protein_game_object"
require "./geniventure_objects/venture_pad_object"

class GeniventureObject < BaseObject
  include EggBasketObject
  include MeiosisObject
  include ProteinGameObject
  include VenturePadObject

  MAP = {css: ".map-button"}
  ROOM_LOCATION = {css: '.location-label'}
  CHALLENGE_HOTSPOT = {id: "enter-challenge-hotspot"}
  NOTIFICATION_NEXT_ARROW = {css: ".next-arrow"}
  NOTIFICATION_CLOSE_BUTTON = {css: '.close-button'}
  LEVEL_TEXT = {css: '.level-indicator-text'}
  MISSION_TEXT = {css: '.mission-label-value'}
  TRIAL_COUNT_TEXT = {css: '.count-text'}
  GEM_NUMBER_TEXT = {css: '.gem-number-text'}
  CONTINUE_BUTTON = {css: '.continue-button'}
  TRY_AGAIN_BUTTON = {css: 'try-again-button'}
  LOADING = {css: '.loading-images'}
  CHALLENGE_ROOM ={css: '.challenge-container'}

  def initialize()
    puts "Initialized"
  end

  def goto_next
    puts "in goto_next"
    click_on(NOTIFICATION_NEXT_ARROW)
  end

  def close_notification
    puts "in close_notification"
    click_on(NOTIFICATION_CLOSE_BUTTON)
  end

  def continue_to_next_level
    puts "in continue_to_next_level"
    click_on(CONTINUE_BUTTON)
  end

  def try_again
    puts "in try again"
    click_on(TRY_AGAIN_BUTTON)
  end

  def get_map
    puts "In get_map"
    click_on(MAP)
  end

  def click_on_challenge_hotspot(challenge)
    puts "in click on challenge hotspot"
    if (challenge == "breeding barn")
      click_with_offset(CHALLENGE_HOTSPOT,150,75)
    else
      click_on(CHALLENGE_HOTSPOT)
    end
  end

  def done_loading?
    wait_for{(CHALLENGE_ROOM).display}
    return true
  end



end