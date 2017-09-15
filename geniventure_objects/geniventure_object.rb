require "../base_object"
require "../geniventure_objects/egg_basket_object"
require "../geniventure_objects/meiosis_object"
require "../geniventure_objects/protein_game_object"
require "../geniventure_objects/venture_pad_object"

class GeniventureObject < BaseObject
  include EggBasketObject
  include MeiosisObject
  include ProteinGameObject
  include VenturePadObject

  MAP = {css: ".map-button"}
  ROOM_LOCATION = {css: '.location-label'}
  SIM_ROOM_CHALLENGE_HOTSPOT = {id: "enter-challenge-hotspot"}
  NOTIFICATION_NEXT_ARROW = {css: ".next-arrow"}
  NOTIFICATION_CLOSE_BUTTON = {css: '.close-button'}
  LEVEL_TEXT = {css: '.level-indicator-text'}
  MISSION_TEXT = {css: '.mission-label-value'}
  TRIAL_COUNT_TEXT = {css: '.count-text'}
  GEM_NUMBER_TEXT = {css: '.gem-number-text'}
  CONTINUE_BUTTON = {css: '.continue-button'}
  TRY_AGAIN_BUTTON = {css: 'try-again-button'}

  def initialize()
    puts "Initialized"
  end

  def goto_next
    click_on(NOTIFICATION_NEXT_ARROW)
  end

  def close_notification
    click_on(NOTIFICATION_CLOSE_BUTTON)
  end

  def continue_to_next_level
    click_on(CONTINUE_BUTTON)
  end

  def try_again
    click_on(TRY_AGAIN_BUTTON)
  end

end