module VenturePadObject
  NEXT_LEVEL_BUTTON = {id: "next-level-button"}
  MISSION_LABEL = {id: 'gem-set-label'}
  GEM_LEVEL_NOT_DONE = {css: '.gem-number-text'}
  GEM_LEVEL_DONE = {css: '.gem-fill'}

  def goto_next_level
    puts "in goto_next_level"
    all_levels = find_all(GEM_LEVEL_NOT_DONE)
    next_level = all_levels[0]
    next_level.click
  end

end