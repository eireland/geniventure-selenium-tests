module MeiosisObject

  YOUR_DRAKE = {css: ".geniblocks .organism"}
  HATCH_DRAKE_BUTTON = {css: '.hatch-drake-button'}
  FEMALE = {css: '.female-label'}
  MALE = {css: '.male-label'}
  DROPDOWN_TOGGLE = {css: '.react-selectize-toggle-button-container'}
  DROPDOWN_MENU_ITEM = {css: '#mountNode > .root-node > .dropdown-menu.react-selectize.simple-select > .option-wrapper > .simple-option > span'}

  TARGET_DRAKE = {css: '#target-drake > img'}

  def select_gender(gender)
    case (gender)
      when "female"
        element = FEMALE
      when "male"
        element = MALE
    end
    click_on(element)
  end

  def select_trait(trait)
    click_on(DROPDOWN_TOGGLE)
    menu_items = find_all(DROPDOWN_MENU_ITEM)
    menu_items.each do |item|
      if item.text == trait
        item.click
      end
    end
  end

  def save_drake
    click_on(HATCH_DRAKE_BUTTON)
  end

  def parse_target_drake
    #get the source link in the TARGET_DRAKE element
    #split the text by '/'
    #take the last element in the array
    #split the text by '_'
    #for each element, figure out which trait needed to get correct drake
  end


end

https://geniverse-resources.concord.org/resources/drakes/images/st_m_noWing_fore_a5_flair_horn_noRostral_healthy.png